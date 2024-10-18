SELECT 
    run."RunnerId",
    gen."Gender",
    extract(year from age(e."StartDateTime", run."DateOfBirth")) AS "AgeDuringEvent",
    e."EventId",
    e."StartDateTime",
    rer."RaceTime"
FROM 
    "Runner" run
join 
	"Gender" gen ON run."GenderId" = gen."GenderId"
join
	"Registration" reg on run."RunnerId" = reg."RunnerId"
JOIN 
    "RegistrationEvent" rer ON reg."RegistrationId" = rer."RegistrationId"
JOIN 
    "Event" e ON rer."EventId" = e."EventId"
WHERE 
    e."StartDateTime" < NOW()
ORDER BY 
    run."RunnerId", e."StartDateTime";

