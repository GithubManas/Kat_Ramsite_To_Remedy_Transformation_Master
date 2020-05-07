



select count(*)
from (

    select
        CircuitID

    from "DDMP_DML"."dbo"."stg_kat_mobilecircuit"
    where CircuitID is not null
    group by CircuitID
    having count(*) > 1

) validation_errors

