drop view if exists dbo.tx_terminal__dbt_tmp_temp_view


   drop table if exists dbo.tx_terminal__dbt_tmp


   EXEC('create view dbo.tx_terminal__dbt_tmp_temp_view as
    With stg_kat_terminal as (

    select * from "DDMP_DML"."dbo"."stg_kat_terminal"
),

tx_terminal as (

    select 
             T.[Terminal Id] as TxID, 
             T.Teknisk as [NE Type] ,
             T.Navn as [NE Name] , 
             T.Gade + '' ''+ T.Nr +'' ''+ isnull( T.Bogst,'''') +'' ''+ isnull(T.Etage ,'''') +'' '' + isnull(T.Lejl,'''') as [Address]  ,
             T.PostNr as PostalCode ,
             T.[By] as City ,
             T.Geocode  
from  stg_kat_terminal T  
)
select * from tx_terminal
    ');

   SELECT * INTO dbo.tx_terminal__dbt_tmp FROM
    dbo.tx_terminal__dbt_tmp_temp_view

   drop view if exists dbo.tx_terminal__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_tx_terminal__dbt_tmp.dbo_tx_terminal__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_tx_terminal__dbt_tmp_cci
    ON dbo.tx_terminal__dbt_tmp

   

