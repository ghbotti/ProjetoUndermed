create or replace function fun_formata_telefone
( 
  TELEFONE IN  varchar2
) 
return  varchar2
is
  --
  telefone_formatado varchar2(14);
  --
begin
  --
  if length(TELEFONE) = 10 then
    --
    telefone_formatado := '('||substr(telefone,1,2)||')'||substr(telefone,3,4)||'-'||substr(telefone,7,4);
    --
  elsif length(TELEFONE) = 11 then
    --
    telefone_formatado := '('||substr(telefone,1,2)||')'||substr(telefone,3,5)||'-'||substr(telefone,8,4);
    --
  end if;
  --
  return telefone_formatado;
  --
end;
/
