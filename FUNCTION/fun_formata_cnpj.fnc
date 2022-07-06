CREATE OR REPLACE FUNCTION fun_formata_cnpj
( 
  nr_cnpj IN     NUMBER
) 
return VARCHAR2
is
  --
  ds_cnpj VARCHAR2(18);
  --
BEGIN
  --
  if nr_cnpj is null then
    --
    return null;
    --
  end if;
  --
  select substr(lpad(to_char(nr_cnpj),14,'0'),1,2)||'.'||
         substr(lpad(to_char(nr_cnpj),14,'0'),3,3)||'.'||
         substr(lpad(to_char(nr_cnpj),14,'0'),6,3)||'/'||
         substr(lpad(to_char(nr_cnpj),14,'0'),9,4)||'-'||
         substr(lpad(to_char(nr_cnpj),14,'0'),13,2)
    into ds_cnpj
    from dual;
  --      
  return ds_cnpj;        
  --
END;
/
