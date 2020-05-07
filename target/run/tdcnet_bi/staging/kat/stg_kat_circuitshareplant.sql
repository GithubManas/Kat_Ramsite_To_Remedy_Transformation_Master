drop view if exists remedy.stg_kat_circuitshareplant__dbt_tmp_temp_view


   drop table if exists remedy.stg_kat_circuitshareplant__dbt_tmp


   EXEC('create view remedy.stg_kat_circuitshareplant__dbt_tmp_temp_view as
    With Src_Kat_CircuitSharePlant as (

    select * from "DDMP_DRA"."kat"."SharedCablePlant"
),

stg_kat_circuitshareplant as (

    select
       [Share Cable Id]
      ,[Share Cable Nr]
      ,[Last Mile Cable Junction]
      ,[Last Mile Junction Terminal]
      ,[Mobile Terminal]
      ,[Root Terminal]
      ,[Cable Status]
      ,[Damage Mark]
      ,getdate() as LoadDateTime
    from Src_Kat_CircuitSharePlant
)

select * from stg_kat_circuitshareplant
    ');

   SELECT * INTO remedy.stg_kat_circuitshareplant__dbt_tmp FROM
    remedy.stg_kat_circuitshareplant__dbt_tmp_temp_view

   drop view if exists remedy.stg_kat_circuitshareplant__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS remedy_stg_kat_circuitshareplant__dbt_tmp.remedy_stg_kat_circuitshareplant__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX remedy_stg_kat_circuitshareplant__dbt_tmp_cci
    ON remedy.stg_kat_circuitshareplant__dbt_tmp

   

