select 
  "CharityName", 
  sum("SponsorshipTarget"), 
  count("SponsorName") 
from 
  "Registration" r  
join 
  "Charity" c on c."CharityId" = r."CharityId"  
join 
  "Sponsorship" s on s."RegistrationId" = r."RegistrationId"  
group by 
  "CharityName"; 
 
select
  count(distinct "CharityName") as "CountCharity",
  count("SponsorName") as "CountSponsors", 
  sum("SponsorshipTarget") as "TotalCost" 
from 
  "Registration" r  
join 
  "Sponsorship" s on s."RegistrationId" = r."RegistrationId" 
join 
  "Charity" c on c."CharityId" = r."CharityId";