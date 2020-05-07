



select count(*)
from (

    select
        CircuitID

    from "DDMP_DRA"."kat"."MobileCircuit"
    where CircuitID is not null
    group by CircuitID
    having count(*) > 1

) validation_errors

