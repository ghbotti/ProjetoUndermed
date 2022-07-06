create or replace procedure PRC_ATUALIZA_RECEBER
(
  codigo       IN     FIMESREC.cd_documento%TYPE,
  dt_pagamento IN     FIMESREC.dt_pagamento%TYPE,
  vl_pagamento IN     FIMESREC.vl_pago%TYPE
)
is
  --
  vValorPago  FIMESREC.vl_pago%TYPE;
  --
BEGIN
  --
  begin
    --
    select nvl(vl_pago,0)
      into vValorPago
      from FIMESREC
     where cd_documento = codigo;
    --
  end;
  --
  begin
    --
    update FIMESREC
       set dt_pagamento    = dt_pagamento,
           vl_pago         = vl_pagamento + vValorPago,
           dt_usualt       = sysdate,
           nm_usualt       = user
     where cd_documento = codigo;
    --
  end;
  --
  commit;
  --
END;
/
