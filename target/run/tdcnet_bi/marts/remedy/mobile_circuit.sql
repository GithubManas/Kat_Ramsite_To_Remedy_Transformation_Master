drop view if exists dbo.mobile_circuit__dbt_tmp_temp_view


   drop table if exists dbo.mobile_circuit__dbt_tmp


   EXEC('create view dbo.mobile_circuit__dbt_tmp_temp_view as
    With Stg_Kat_MobileCircuit as (

    select * from "DDMP_DML"."dbo"."stg_kat_mobilecircuit"
),

mobile_circuit as (

select 
              CircuitID ,
             [Mobile Terminal] as [Terminal 1_MobileTerminal] ,
             [Root Terminal] as [Terminal 2_RootTerminal], 
              [Circuit Status],
             [Group Circuit] as [Logical Group Circuit] ,
             [Group Circuit Position] as [Group Position]
from    
             Stg_Kat_MobileCircuit
)

select * from mobile_circuit
    ');

   SELECT * INTO dbo.mobile_circuit__dbt_tmp FROM
    dbo.mobile_circuit__dbt_tmp_temp_view

   drop view if exists dbo.mobile_circuit__dbt_tmp_temp_view

    
   DROP INDEX IF EXISTS dbo_mobile_circuit__dbt_tmp.dbo_mobile_circuit__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbo_mobile_circuit__dbt_tmp_cci
    ON dbo.mobile_circuit__dbt_tmp

   

