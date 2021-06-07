FROM postgres:9.6-alpine

COPY sql/00_script.sql  /docker-entrypoint-initdb.d/
COPY seeds/*.sql /docker-entrypoint-initdb.d/
COPY index/*.sql /docker-entrypoint-initdb.d/
 
       
  
