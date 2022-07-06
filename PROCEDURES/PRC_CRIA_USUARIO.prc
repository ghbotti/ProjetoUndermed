create or replace procedure PRC_CRIA_USUARIO
( 
  Usuario IN     USUARIOS.nm_usuario%TYPE,  
  Senha   IN     USUARIOS.ds_senha%TYPE
) 
is
  --
begin
  --
  execute immediate 'CREATE USER '||Usuario||' IDENTIFIED BY '||Senha||' DEFAULT TABLESPACE DAD_MAXMED_128K TEMPORARY TABLESPACE TEMP';
  --
end;
/
