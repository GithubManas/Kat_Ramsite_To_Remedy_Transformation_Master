




with all_values as (

    select distinct
        [Site Status] as value_field

    from "DDMP_DML"."dbo"."stg_ramsite_site"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'Ready','On Air'
    )
)

select count(*)
from validation_errors

