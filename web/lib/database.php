<?php

class DataBase {

    // Дескриптор подключения к базе данных
    private $link;

    // Конструктор
    private function __construct()
    {
        global $DBCONFIG;

        $this->link = mysqli_connect('localhost:3307', 'delivery', 'delivery', 'delivery');

        if ($this->link) {
            mysqli_query($this->link, "SET NAMES 'utf8'");
            mysqli_query($this->link, "SET CHARACTER SET 'utf8'");
        } else {
            echo "Ошибка подключения к базе данных";
            exit;
        }
    }

    // Деструктор
    public function __destruct()
    {
        mysqli_close($this->link);
    }

    // Получение экземпляра базы данных
    public static function instance()
    {
        static $instance;
        if (!$instance) {
            $instance = new DataBase();
        }
        return $instance;
    }

    // Возвращает информацию о последней ошибке
    public function lastError()
    {
        return mysqli_error($this->link);
    }

    // Возвращает информацию об указанном пользователе
    public function getUser($login)
    {
        $user = null;

        $query = "select * from user where login = '".$login."' limit 1";

        if ($result = mysqli_query($this->link, $query)) {
            if ($row = mysqli_fetch_assoc($result)) {
                $user = $row;
            }
            mysqli_free_result($result);
        }

        return $user;
    }

    // Возвращает список заданий для указанной даты
    public function getTasksByDate()
    {
        $persons['male'] = [];
        $persons['female'] = [];

        $query  = "select person.id, person.family, person.name, person.patronymic, person.year, gender.name as gender ";
        $query .= "from person ";
        $query .= "join gender on person.gender = gender.id ";
        $query .= "order by person.id";

        if ($result = mysqli_query($this->link, $query)) {
            while ($row = mysqli_fetch_assoc($result)) {
                $persons[$row['gender']][$row['id']] = $row;
            }
            mysqli_free_result($result);
        }

        return $persons;
    }

    // Возвращает список всех заданий
    public function getAllTasks()
    {
        $persons = [];

        $query  = "select person.id, person.family, person.name, person.patronymic, person.year, person.place, person.profession, gender.name as gender ";
        $query .= "from person ";
        $query .= "join gender on person.gender = gender.id ";
        // $query .= "order by person.id";
        $query .= "order by person.family, person.name, person.patronymic";

        if ($result = mysqli_query($this->link, $query)) {
            while ($row = mysqli_fetch_assoc($result)) {
                $persons[$row['id']] = $row;
            }
            mysqli_free_result($result);
        }

        return $persons;
    }

    // Возвращает все данные для указанного ID
    public function getData($id)
    {
        $person = [
            'id' => '',
            'family' => '',
            'name' => '',
            'patronymic' => '',
            'gender' => '',
            'year' => '',
            'place' => '',
            'profession' => '',
            'comment' => '',
            'fictive' => '',
            'fatherId' => '',
            'motherId' => '',
            'father' => [],
            'mother' => []
        ];

        if (empty($id)) {
            return $person;
        }

        $query  = "select person.id, person.family, person.name, person.patronymic, gender.name as gender, ";
        $query .= "person.year, person.place, person.profession, person.comment, person.fictive, tree.father, tree.mother ";
        $query .= "from person ";
        $query .= "join gender on person.gender = gender.id ";
        $query .= "join tree on person.id = tree.person ";
        $query .= "where tree.person = '".$id."' ";
        $query .= "limit 1";

        if ($result = mysqli_query($this->link, $query)) {
            if ($row = mysqli_fetch_assoc($result)) {
                $person['id'] = $row['id'];
                $person['family'] = $row['family'];
                $person['name'] = $row['name'];
                $person['patronymic'] = $row['patronymic'];
                $person['gender'] = $row['gender'];
                $person['year'] = $row['year'];
                $person['place'] = $row['place'];
                $person['profession'] = $row['profession'];
                $person['comment'] = $row['comment'];
                $person['fictive'] = $row['fictive'];
                $person['fatherId'] = $row['father'];
                $person['motherId'] = $row['mother'];
            }
            mysqli_free_result($result);
        }

        return $person;
    }

    // Добавляет новую запись в таблицу task
    public function addTask($data)
    {
        $result = false;

        $family = htmlspecialchars($data['family']);
        $name = htmlspecialchars($data['name']);
        $patronymic = htmlspecialchars($data['patronymic']);
        $gender = htmlspecialchars($data['gender']);
        $year = htmlspecialchars($data['year']);
        $place = htmlspecialchars($data['place']);
        $profession = htmlspecialchars($data['profession']);
        $comment = htmlspecialchars($data['comment']);
        $father = htmlspecialchars($data['father']);
        $mother = htmlspecialchars($data['mother']);

        $query  = "insert into person (family, name, patronymic, gender, year, place, profession, comment) ";
        $query .= "values ('".$family."', '".$name."', '".$patronymic."', '".$gender."', '".$year."', '".$place."', '".$profession."', '".$comment."')";

        if (mysqli_query($this->link, $query)) {
            $id = mysqli_insert_id($this->link);

            $query  = "insert into tree (person, father, mother) ";
            $query .= "values ('".$id."', '".$father."', '".$mother."')";

            $result = mysqli_query($this->link, $query);
        }

        return $result;
    }

    // Изменяет указанную запись в таблице task
    public function updateTask($id, $data)
    {
        $result = false;

        $id = htmlspecialchars($id);
        $family = htmlspecialchars($data['family']);
        $name = htmlspecialchars($data['name']);
        $patronymic = htmlspecialchars($data['patronymic']);
        $gender = htmlspecialchars($data['gender']);
        $year = htmlspecialchars($data['year']);
        $place = htmlspecialchars($data['place']);
        $profession = htmlspecialchars($data['profession']);
        $comment = htmlspecialchars($data['comment']);
        $father = htmlspecialchars($data['father']);
        $mother = htmlspecialchars($data['mother']);

        $query  = "update person ";
        $query .= "set family = '".$family."', name = '".$name."', patronymic = '".$patronymic."', gender = '".$gender."', year = '".$year."', place = '".$place."', profession = '".$profession."', comment = '".$comment."' ";
        $query .= "where id = '".$id."'";

        if ($result = mysqli_query($this->link, $query)) {
            $query  = "update tree ";
            $query .= "set father = '".$father."', mother = '".$mother."' ";
            $query .= "where person = '".$id."'";

            $result = mysqli_query($this->link, $query);
        }

        return $result;
    }

}

?>
