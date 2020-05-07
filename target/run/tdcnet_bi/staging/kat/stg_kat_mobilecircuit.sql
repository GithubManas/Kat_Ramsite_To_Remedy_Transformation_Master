drop view if exists dbo.stg_kat_mobilecircuit__dbt_tmp_temp_view


   drop table if exists dbo.stg_kat_mobilecircuit__dbt_tmp


   EXEC('create view dbo.stg_kat_mobilecircuit__dbt_tmp_temp_view as
    With Src_Kat_MobileCircuit as (

    select * from "DDMP_DRA"."kat"."MobileCircuit"
),

stg_kat_mobilecircuit as (

    select
      [CircuitID]
      ,[Mobile Terminal]
      ,[Root Terminal]
      ,[Circuit Status]
      ,[Damage Mark]
      ,[Cable Share Plant]
      ,[Last mile Terminal]
      ,[Group Circuit]
      ,[Group Circuit T1]
      ,[Group Circuit T2]
      ,[Group Circuit Position]
      ,[Group Circuit Type]
      ,getdate() as LoadDateTime
    from 
      Src_Kat_MobileCircuit
    where 
      [Circuit Status] in (''Active'',''Damaged'')

)

select * from stg_kat_mobilecircuit
    ');

   SELECT * INTO dbo.stg_kat_mobilecircuit__dbt_tmp FROM
    dbo.stg_kat_mobilecircuit__dbt_tmp_temp_view

   drop view if exists dbo.stg_kat_mobilecircuit__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_stg_kat_mobilecircuit__dbt_tmp.dbo_stg_kat_mobilecircuit__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_stg_kat_mobilecircuit__dbt_tmp_cci
    ON dbo.stg_kat_mobilecircuit__dbt_tmp

   

