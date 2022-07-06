create or replace procedure PRC_ATUALIZA_FINANCEIRO
( 
  data_atual IN     DATE
) 
is
  --
BEGIN
  --
  update fimesrec
     set st_documento = 'VE'
   where dt_vencimento < data_atual 
     and st_documento = 'AB';
  --
  commit;
  --
END;
/
