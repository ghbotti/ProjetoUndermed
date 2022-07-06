create or replace procedure PRC_GRANT_USUARIO
(
  Usuario IN     USUARIOS.nm_usuario%TYPE
)
is
  --
begin
  --
  execute immediate 'GRANT DBA, GERAL, CREATE SESSION, CREATE USER, ALTER USER TO '||Usuario||' WITH ADMIN OPTION';
  --
end;
/
