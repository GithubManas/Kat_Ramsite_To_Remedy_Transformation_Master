



select count(*)
from (

    select
        [Share Cable Id]

    from "DDMP_DRA"."kat"."SharedCablePlant"
    where [Share Cable Id] is not null
    group by [Share Cable Id]
    having count(*) > 1

) validation_errors

