create or replace procedure PRC_ATUALIZA_DATA_CONFIGURACAO
( 
  data_atual IN     DATE
) 
is
  --
BEGIN
  --
  update configuracoes
     SET dt_configuracao = data_atual,
         nm_usualt = USER,
         dt_usualt = SYSDATE;
  --
  commit;
  --
END;
/
