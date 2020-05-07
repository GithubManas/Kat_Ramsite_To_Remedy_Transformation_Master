



select count(*)
from (

    select
        [Site Id]

    from "DDMP_DRA"."ramsite"."site"
    where [Site Id] is not null
    group by [Site Id]
    having count(*) > 1

) validation_errors

