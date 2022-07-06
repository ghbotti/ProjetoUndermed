create or replace procedure PRC_ALTERA_SENHA
( 
  Usuario IN     USUARIOS.nm_usuario%TYPE,  
  Senha   IN     USUARIOS.ds_senha%TYPE
) 
is
  --
begin
  --
  execute immediate 'ALTER USER '||Usuario||' IDENTIFIED BY '||Senha||'';
  --
end;
/
