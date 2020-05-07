



select count(*)
from (

    select
        [Terminal Id]

    from "DDMP_DML"."dbo"."stg_kat_terminal"
    where [Terminal Id] is not null
    group by [Terminal Id]
    having count(*) > 1

) validation_errors

