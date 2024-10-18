SELECT 
  m."MarathonName",
  e."EventName",
  to_char( (re."RaceTime" ||'seconds')::interval, 'HH24:MI:SS') as "Time",
  RANK() OVER (PARTITION BY e."EventId" ORDER BY re."RaceTime" ASC) AS "Position",
  RANK() OVER (PARTITION BY e."EventId", g."GenderId" ORDER BY re."RaceTime" ASC) AS "PositionGender"
FROM
  "Marathon" m 
JOIN
  "Event" e on m."MarathonId" = e."MarathonId" 
JOIN
  "RegistrationEvent" re on e."EventId" = re."EventId" 
JOIN
  "Country" c on m."CountryCode" = c."CountryCode" 
left join 
  "Volunteer" v on c."CountryCode" = v."CountryCode" 
join 
  "Gender" g on g."GenderId" = g."GenderId";
