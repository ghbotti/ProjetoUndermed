create or replace view view_doc_quitados as
select cd_documento,
       cd_cliente,
       dt_pagamento,
       vl_pago,
       cd_historico
  from fimesrec
 where st_documento = 'PG';
