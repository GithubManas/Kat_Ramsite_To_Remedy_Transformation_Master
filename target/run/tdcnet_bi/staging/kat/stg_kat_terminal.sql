drop view if exists dbo.stg_kat_terminal__dbt_tmp_temp_view


   drop table if exists dbo.stg_kat_terminal__dbt_tmp


   EXEC('create view dbo.stg_kat_terminal__dbt_tmp_temp_view as
    With Src_Kat_Terminal as (

    select * from "DDMP_DRA"."kat"."Terminal"
),

stg_kat_terminal as (

    select
      [Terminal Id]
      ,[Navn]
      ,[Stednavn]
      ,[Teknisk]
      ,[Gade]
      ,[Nr]
      ,[Bogst]
      ,[Etage]
      ,[Lejl]
      ,[PostNr]
      ,[By]
      ,[Geocode]
      ,[Dok Central]
      ,[Share Connection 1]
      ,[Share Connection 2]
      ,[Damage Mark]
      ,getdate() as LoadDateTime
    from Src_Kat_Terminal
)

select * from stg_kat_terminal
    ');

   SELECT * INTO dbo.stg_kat_terminal__dbt_tmp FROM
    dbo.stg_kat_terminal__dbt_tmp_temp_view

   drop view if exists dbo.stg_kat_terminal__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_stg_kat_terminal__dbt_tmp.dbo_stg_kat_terminal__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_stg_kat_terminal__dbt_tmp_cci
    ON dbo.stg_kat_terminal__dbt_tmp

   

