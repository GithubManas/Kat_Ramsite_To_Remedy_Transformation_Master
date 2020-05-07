drop view if exists dbo.stg_ramsite_site__dbt_tmp_temp_view


   drop table if exists dbo.stg_ramsite_site__dbt_tmp


   EXEC('create view dbo.stg_ramsite_site__dbt_tmp_temp_view as
    With Src_Ramsite_Site as (

    select * from "DDMP_DRA"."ramsite"."site"
),

stg_ramsite_site as (

    select
      [Site Id]
      ,[Site Name]
      ,[English Name]
      ,[Cluster]
      ,[Priority]
      ,[RNC ID]
      ,[BSC ID]
      ,[EPC ID]
      ,[Site Status]
      ,[Address 1]
      ,[House No]
      ,[PostCode]
      ,[City]
      ,[Municipality]
      ,[County]
      ,[Country]
      ,[Easting UTM32-ED50]
      ,[Northing UTM32-ED50]
      ,[Longitude-WGS84]
      ,[Latitude-WGS84]
      ,[Site Type]
      ,[Structure Type]
      ,[Transmission Name]
      ,[CircuitIds]
      ,getdate() as LoadDateTime
    from Src_Ramsite_Site
    Where
        [Site Status] in (''Ready'',''On Air'')

)

select * from stg_ramsite_site
    ');

   SELECT * INTO dbo.stg_ramsite_site__dbt_tmp FROM
    dbo.stg_ramsite_site__dbt_tmp_temp_view

   drop view if exists dbo.stg_ramsite_site__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_stg_ramsite_site__dbt_tmp.dbo_stg_ramsite_site__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_stg_ramsite_site__dbt_tmp_cci
    ON dbo.stg_ramsite_site__dbt_tmp

   

