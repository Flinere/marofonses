select 
	count(*) from (
		select distinct 
			u."FirstName", 
			u."LastName", 
			rnr."Email", 
			rgs."RegistrationStatus"
		from 
			"User" u
		JOIN 
			"Role" r on u."RoleId" = r."RoleId" 
		join 
			"Runner" rnr on u."Email" = rnr."Email" 
		join 
			"Registration" reg on rnr."RunnerId" = reg."RunnerId"
		join 
			"RegistrationEvent" rei on reg."RegistrationId" = rei."RegistrationId"
		join 
			"Event" ev on rei."EventId" = ev."EventId" 
		join 
			"RegistrationStatus" rgs on reg."RegistrationStatusId" = rgs."RegistrationStatusId"  
		where 
			ev."EventTypeId" = 'FM' and rgs."RegistrationStatusId" = 1
			) as "a"
