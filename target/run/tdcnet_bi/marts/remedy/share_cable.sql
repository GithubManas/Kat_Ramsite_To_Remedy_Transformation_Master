drop view if exists dbo.share_cable__dbt_tmp_temp_view


   drop table if exists dbo.share_cable__dbt_tmp


   EXEC('create view dbo.share_cable__dbt_tmp_temp_view as
    With stg_kat_sharedcableplant as (

    select * from "DDMP_DML"."dbo"."stg_kat_sharedcableplant"
),

share_cable as (

    select 
             [Share Cable Nr] as CableID,
             substring ( substring ([Share Cable Id],1,len([Share Cable Id])-len([Share Cable Nr]) ) , charindex(''-'', substring ([Share Cable Id],1,len([Share Cable Id])-len([Share Cable Nr]) ) )+1,len(substring ([Share Cable Id],1,len([Share Cable Id])-len([Share Cable Nr]) ))  ) as [Terminal 1_RTN],
             substring ( substring ([Share Cable Id],1,len([Share Cable Id])-len([Share Cable Nr]) ) ,1, charindex(''-'', substring ([Share Cable Id],1,len([Share Cable Id])-len([Share Cable Nr]) ) )-1 ) as [Terminal 2_Lmile T.],
             [Last Mile Cable Junction] as [Lmile Cable Junction],
             [Last Mile Junction Terminal] as [Lmile Junction Terminal],
             [Cable Status]
    from stg_kat_sharedcableplant

)
select * from share_cable
    ');

   SELECT * INTO dbo.share_cable__dbt_tmp FROM
    dbo.share_cable__dbt_tmp_temp_view

   drop view if exists dbo.share_cable__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_share_cable__dbt_tmp.dbo_share_cable__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_share_cable__dbt_tmp_cci
    ON dbo.share_cable__dbt_tmp

   

