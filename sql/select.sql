select task.id, task.date_planned as date, type.name as type, task.address, task.person, task.phone
from task
join type on task.type_id = type.id
where task.date_planned >= '2023-05-01' and task.date_planned <= '2023-05-07'
order by task.date_planned, task.id;
