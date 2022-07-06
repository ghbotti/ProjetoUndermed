create or replace view view_consulta_funcionario as
select e.cd_empregado,
         a.dt_faturamento,
         b.nm_razao_social,
         c.nm_exame,
         d.nm_etapa,
         a.dt_exame
    from lanctoexame a,
         clientes    b,
         exames      c,
         etapas      d,
         empregados  e
   where a.cd_cliente = b.cd_cliente
     and a.cd_exame            = c.cd_exame
     and a.cd_etapa            = d.cd_etapa
     and a.cd_empregado    = e.cd_empregado;
