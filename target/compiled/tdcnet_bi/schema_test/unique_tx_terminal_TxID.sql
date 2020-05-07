



select count(*) as validation_errors
from (

    select
        TxID as validation_errors

    from "DDMP_DML"."remedy"."tx_terminal"
    where TxID is not null
    group by TxID
    having count(*) > 1

) validation_errors

