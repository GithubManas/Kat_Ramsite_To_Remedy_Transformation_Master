



select count(*) as validation_errors
from (

    select
        CableID as validation_errors

    from "DDMP_DML"."remedy"."share_cable"
    where CableID is not null
    group by CableID
    having count(*) > 1

) validation_errors

