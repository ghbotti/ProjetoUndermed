CREATE OR REPLACE FUNCTION fun_formata_cpf
( 
  nr_cpf IN NUMBER
) 
return varchar2 is
  --
  ds_cpf varchar2(14);
  --
begin
  --
  select substr(lpad(to_char(nr_cpf),11,'0'),1,3)||'.'||
         substr(lpad(to_char(nr_cpf),11,'0'),4,3)||'.'||
         substr(lpad(to_char(nr_cpf),11,'0'),7,3)||'-'||
         substr(lpad(to_char(nr_cpf),11,'0'),10,2) 
    into ds_cpf
    from dual;
  --      
  return ds_cpf;        
  --
end; 
 
/
