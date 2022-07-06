create or replace view view_mensalidade as
select cd_cliente,
         nr_cpf_cnpj_cliente,
         nm_razao_social,
         vl_mensalidade
    from clientes
   where nvl(vl_mensalidade,0) > 0;
