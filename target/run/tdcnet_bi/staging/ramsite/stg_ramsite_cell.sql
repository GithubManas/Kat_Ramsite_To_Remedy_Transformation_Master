drop view if exists dbo.stg_ramsite_cell__dbt_tmp_temp_view


   drop table if exists dbo.stg_ramsite_cell__dbt_tmp


   EXEC('create view dbo.stg_ramsite_cell__dbt_tmp_temp_view as
    With Src_Ramsite_Cell as (

    select * from "DDMP_DRA"."ramsite"."cell"
),

stg_ramsite_cell as (

    select
      [Cell Id]
      ,[Site Id]
      ,[Name]
      ,[Status]
      ,[System Type]
      ,[Traffic Area]
      ,[Position]
      ,[Azimuth]
      ,[Sector]
      ,[Center Name]
      ,[Radius]
      ,[NodeName]
      ,[eNodeB ID]
      ,[gNodeB ID]
      ,[BSC_RNC]
      ,getdate() as LoadDateTime
    from Src_Ramsite_Cell

)

select * from stg_ramsite_cell
    ');

   SELECT * INTO dbo.stg_ramsite_cell__dbt_tmp FROM
    dbo.stg_ramsite_cell__dbt_tmp_temp_view

   drop view if exists dbo.stg_ramsite_cell__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_stg_ramsite_cell__dbt_tmp.dbo_stg_ramsite_cell__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_stg_ramsite_cell__dbt_tmp_cci
    ON dbo.stg_ramsite_cell__dbt_tmp

   

