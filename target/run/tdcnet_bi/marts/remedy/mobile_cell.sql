drop view if exists dbo.mobile_cell__dbt_tmp_temp_view


   drop table if exists dbo.mobile_cell__dbt_tmp


   EXEC('create view dbo.mobile_cell__dbt_tmp_temp_view as
    With Stg_Ramsite_Cell as (

    select * from "DDMP_DML"."dbo"."stg_ramsite_cell"
),

mobile_cell as (

    select 
             [Cell Id],
             '''' test1,
             [Site Id] ,
             Name  as [Cell Name] ,
             Status as [Cell Status],
             case 
                          when [System Type] like ''%GSM%'' then ''2G''
                          when [System Type] like ''%UMTS%'' then ''3G''
                          when [System Type] like ''%LTE%'' then ''4G''
                          else ''5G''
             end [Cell Type],
             [System Type] ,
             [Traffic Area] ,
             Position as Cell_Position,
             Azimuth ,
             Sector ,
             Radius as [Cell Radius],
             NodeName as [NodeName],
             [eNodeB ID] as [eNodeB ID],
             [gNodeB ID] as [gNodeB ID] ,
             BSC_RNC as BSC_RNC 
    from    
                stg_ramsite_cell

)

select * from mobile_cell
    ');

   SELECT * INTO dbo.mobile_cell__dbt_tmp FROM
    dbo.mobile_cell__dbt_tmp_temp_view

   drop view if exists dbo.mobile_cell__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_mobile_cell__dbt_tmp.dbo_mobile_cell__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_mobile_cell__dbt_tmp_cci
    ON dbo.mobile_cell__dbt_tmp

   

