



select count(*) as validation_errors
from (

    select
        Site ID as validation_errors

    from "DDMP_DML"."remedy"."site_type"
    where Site ID is not null
    group by Site ID
    having count(*) > 1

) validation_errors

