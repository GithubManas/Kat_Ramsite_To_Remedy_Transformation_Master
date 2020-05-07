



select count(*) as validation_errors
from "DDMP_DML"."remedy"."tx_terminal"
where TxID is null

