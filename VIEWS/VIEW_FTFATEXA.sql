create or replace view view_ftfatexa as
select b.cd_cliente,
         b.nm_razao_social,
         a.cd_exame,
         c.nm_exame,
         count(*)           quantidade,
         a.dt_exame,
         sum(a.vl_exame)    vl_exame
    from lanctoexame a,
         clientes    b,
         exames      c
   where a.cd_cliente = b.cd_cliente
     and a.cd_exame            = c.cd_exame
     and a.tp_condicao_pagto   = 'P'
   group by b.cd_cliente,
            b.nm_razao_social,
            a.cd_exame,
            c.nm_exame,
            a.dt_exame
   order by b.cd_cliente;
