create or replace function fun_formata_rg
( 
  RG IN     varchar2
) 
return  varchar2
is
  --
  rg_formatado varchar2(12);
  --
begin
  --
  if length(RG) = 8 then
    --
    rg_formatado := substr(RG,1,1)||'.'||substr(RG,2,3)||'.'||substr(RG,5,3)||'-'||substr(RG,8,1);
    --
  else
    --
    rg_formatado := substr(RG,1,2)||'.'||substr(RG,3,3)||'.'||substr(RG,6,3)||'-'||substr(RG,9,1);
    --
  end if;
  --
  return rg_formatado;
  --
end;
/
