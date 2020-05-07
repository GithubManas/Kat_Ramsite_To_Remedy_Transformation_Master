drop view if exists dbo.stg_kat_sharedcableplant__dbt_tmp_temp_view


   drop table if exists dbo.stg_kat_sharedcableplant__dbt_tmp


   EXEC('create view dbo.stg_kat_sharedcableplant__dbt_tmp_temp_view as
    With Src_Kat_SharedCablePlant as (

    select * from "DDMP_DRA"."kat"."SharedCablePlant"
),

stg_kat_sharedcableplant as (

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
    from 
        Src_Kat_SharedCablePlant
    where 
        [Cable Status] in (''Active'',''Damaged'')
)

select * from stg_kat_sharedcableplant
    ');

   SELECT * INTO dbo.stg_kat_sharedcableplant__dbt_tmp FROM
    dbo.stg_kat_sharedcableplant__dbt_tmp_temp_view

   drop view if exists dbo.stg_kat_sharedcableplant__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_stg_kat_sharedcableplant__dbt_tmp.dbo_stg_kat_sharedcableplant__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_stg_kat_sharedcableplant__dbt_tmp_cci
    ON dbo.stg_kat_sharedcableplant__dbt_tmp

   

