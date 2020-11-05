--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
				-- PSD-24321 | Abatimento do empréstimo no resgate de cotas - Regime: Regressivo --
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-- Paulo Henrique...


Não funciona pra regressiva...
Tem que fazer o processo normal como se tivesse tudo certo...
pct_resg_partf


Não tem um modulo de emprestimo na Sinqui, é feito direto no Santander...


1º Fazer a carga do arquivo txt no Charger
   Solicitar para a 'Marcia Cristina Sanches'(Empréstimo) dar inicio no resgate desse particpante, processar a Simulação dos 
   resgates para a data informada.
   * Verificar se gerou o registro nas tabelas.



2º Pedir para a (Aledia Rodrigues Lemos)(Capitalização) confirmar esse resgate, avisar a equipe de T.I. quando este processo 
   for finalizado. Aí vai criar os registros nas tabelas:
    Necessário validar...
	
  Exemplo que usei para efetuar o contato:	
  Boa tarde Aledia, tudo bem? 
  Estou trabalhando com a atividade PSD-24321 | Abatimento do empréstimo no resgate de cotas - Regime: Regressivo, 
  você pode por gentileza confirmar esse resgate?
  
  Aledia de Capitalização precisa eviar o anexo do documento que contém as informações dessa transação, para conferir na
  tabela TAB ABATIMENTO DO RESGATE, conforme abaixo:
   
-- TAB ABATIMENTO DO RESGATE
SELECT F.DTA_FINAL
      ,F.VLR_EFET_ABAT
      ,F.*
FROM ATT.FCESP_TAB_VLR_ABAT_RESG F
WHERE 0=0
AND F.COD_EMPRS = 2
AND F.NUM_MATR_PARTF  =79960
AND F.NUM_RGTRO_EMPRG = 487061



-- TAB SALDO CONTA
SELECT S.VLR_SAIMES_SDCTPR
      ,S.VLR_SDANT_SDCTPR
      ,S.VLR_ENTMES_SDCTPR
      ,S.VLR_CRMSAN_SDCTPR
      ,S.*
FROM ATT.SLD_CONTA_PARTIC_FSS S
WHERE 0=0
AND S.NUM_MATR_PARTF = 79960
AND S.ANO_MOVIM_SDCTPR = 2020
AND S.ANOMES_MOVIM_SDCTPR = 202010
AND S.NUM_CTFSS IN (104,107,105)



Obs:
 Toda vez tem tem resgate e o usuário tem emprestimo, vai ter que fazer isso, neste caso é um 
 pouco difernte porque é um regime de tributação progressivo...


-- GMUD-5795
J:\Change_Request\Desenvolvimento\Amadeus\Capitalizacao\GMUD-5763_20201027_Desenv_Adriano_AbatimendoResgate
02_proc_retorno.sql
-- Executado!




 Tabelas usadas neste processo análise:
/* 
 
-- TAB EMPREGADO
SELECT *
FROM ATT.EMPREGADO E
WHERE 1=1
AND E.NUM_MATR_PARTF  = 79960
AND E.NUM_RGTRO_EMPRG = 487061
AND UPPER(E.NOM_EMPRG) LIKE UPPER('%LORENA CARDOSO BORGES DOS SANTOS%')

-- TAB ABATIMENTO EMPR
SELECT FA.VLR_ABAT
      ,FA.PCT_RESG_PARTF
      ,FA.*
FROM ATT.FCESP_ABAT_EMPREST_SLD_CONTA FA
WHERE 0=0 
AND FA.NUM_MATR_PARTF = 79960
AND FA.NUM_CTFSS = 104


-- TAB SALDO CONTA
SELECT S.VLR_SAIMES_SDCTPR -- Qtde. Em U.M 
      ,S.VLR_SDANT_SDCTPR
      ,S.VLR_CRMSAN_SDCTPR
      ,S.*
FROM ATT.SLD_CONTA_PARTIC_FSS S
WHERE 0=0
AND S.NUM_MATR_PARTF = 79960
AND S.ANO_MOVIM_SDCTPR = 2020
AND S.ANOMES_MOVIM_SDCTPR = 202010
AND S.NUM_CTFSS IN (104);-- ,107,105


-- TAB ABATIMENTO DO RESGATE
SELECT F.DTA_FINAL
      ,F.VLR_ABAT --   
      ,F.VLR_EFET_ABAT -- QUOTAS Empréstimo Pessoal-IGP 8
      ,F.*
FROM ATT.FCESP_TAB_VLR_ABAT_RESG F
WHERE 0=0
AND F.COD_EMPRS = 2
AND F.NUM_MATR_PARTF  =79960
AND F.NUM_RGTRO_EMPRG = 487061

*/






























