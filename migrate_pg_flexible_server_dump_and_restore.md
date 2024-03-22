# Dump Postgres Flexible Server Azure: Migrando bancos de dados e usuários 
(how-to-migrate-using-dump-and-restore)[https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/postgresql/migrate/how-to-migrate-using-dump-and-restore.md]

# 01- Fazer o dump do database e das roles via terminal no seu computador

    $ pg_dump <database name> --exclude-schema=schema_name -h <server name> -U user_name > database_name_dump.sql

    $ pg_dumpall -r --no-role-passwords -h <server name> -U <user name> > <database name>roles.sql

# 02- Cleaning up the roles dump
## Use the following sed command to clean up your roles dump:

    $ sed -i '/azure_superuser/d; /azure_pg_admin/d; /azuresu/d; /^CREATE ROLE replication/d; /^ALTER ROLE replication/d; /^ALTER ROLE/ {s/NOSUPERUSER//; s/NOBYPASSRLS//;}' roles.sql

# 03- Restore the data into the target database
## Restore roles and users

    $ psql -f roles.sql -h <server_name> -U <user_name>

# 04- Create a new database

    $ createdb <new database name> -h <server name> -U <user name>

# 05- Restoring the dump

    $ psql -f <database name>_dump.sql <new database name> -h <server name> -U <user name> 2> errors.log

# 06- Post-restoration check
After the restoration process is complete, it's important to review the errors.log file for any errors that may have occurred.
