



select count(*)
from (

    select
        [Cell Id]

    from "DDMP_DRA"."ramsite"."cell"
    where [Cell Id] is not null
    group by [Cell Id]
    having count(*) > 1

) validation_errors

