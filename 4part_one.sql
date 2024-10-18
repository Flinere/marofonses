select 
  ev."EventName", 
  count(re."RaceTime") as count_of_runners,
  to_char( (round(avg(re."RaceTime"), 0) ||'seconds')::interval, 'HH24:MI:SS' ) as avg_time
from 
  "Event" ev
inner join
  "RegistrationEvent" re on ev."EventId" = re."EventId"
where 
  re."RaceTime" != 0
group by 
  ev."EventName"
order by 
  "EventName";

