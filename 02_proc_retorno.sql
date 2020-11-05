SET ECHO ON
SET TIME ON
SET TIMING ON
SET SQLBL ON
SET SERVEROUTPUT ON SIZE 1000000
SET DEFINE OFF
SHOW USER
SELECT * FROM GLOBAL_NAME;
SELECT INSTANCE_NAME, HOST_NAME FROM V$INSTANCE;
SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI:SS') DATA FROM DUAL;


--- após a efetivação dos resgates de cotas pela Capitalização.

begin
att.fcesp_ret_abat_resg_cotas(1,
                         to_date('30-04-2020', 'dd-mm-yyyy')); --- Data da simulação do resgate de cotas
end;
/

spool off;
exit;