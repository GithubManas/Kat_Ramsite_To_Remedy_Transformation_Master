drop view if exists dbo.circuit_group__dbt_tmp_temp_view


   drop table if exists dbo.circuit_group__dbt_tmp


   EXEC('create view dbo.circuit_group__dbt_tmp_temp_view as
    With Stg_Kat_MobileCircuit as (

    select * from "DDMP_DML"."dbo"."stg_kat_mobilecircuit"
),
circuit_group as (
select distinct
             [Group Circuit T1]+''-''+[Group Circuit T2] as [Circuit Group ID],
             [Group Circuit T1],
             [Group Circuit T2],
             [Group Circuit Type] as [Group Type]
from 
             Stg_Kat_MobileCircuit
where 
             [Group Circuit] is not null
)

select * from circuit_group
    ');

   SELECT * INTO dbo.circuit_group__dbt_tmp FROM
    dbo.circuit_group__dbt_tmp_temp_view

   drop view if exists dbo.circuit_group__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_circuit_group__dbt_tmp.dbo_circuit_group__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_circuit_group__dbt_tmp_cci
    ON dbo.circuit_group__dbt_tmp

   

