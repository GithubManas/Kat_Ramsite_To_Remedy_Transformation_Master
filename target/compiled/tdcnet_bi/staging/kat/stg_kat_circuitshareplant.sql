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