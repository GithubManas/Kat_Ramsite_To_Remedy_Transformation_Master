



select count(*) as validation_errors
from (

    select
        Cell ID as validation_errors

    from "DDMP_DML"."remedy"."mobile_cell"
    where Cell ID is not null
    group by Cell ID
    having count(*) > 1

) validation_errors

