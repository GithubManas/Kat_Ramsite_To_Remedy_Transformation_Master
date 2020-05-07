




with all_values as (

    select distinct
        [Cable Status] as value_field

    from "DDMP_DML"."dbo"."stg_kat_sharedcableplant"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'Active','Damaged'
    )
)

select count(*)
from validation_errors

