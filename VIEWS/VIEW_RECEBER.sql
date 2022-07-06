create or replace view view_receber as
select cd_documento                   codigo,
         st_documento                   situacao,
         st_origem                      origem,
		     cd_cliente            cliente,
         dt_vencimento                  vencimento,
         vl_documento                   valor,
         vl_documento - nvl(vl_pago, 0) valor_aberto,
         sq_ftfatmen                    mensalidade,
         sq_lanctoexame                 cd_lancamento
  from fimesrec;
