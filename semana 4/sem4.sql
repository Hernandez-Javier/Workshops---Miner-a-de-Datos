select case  when  fila = 1  then 'create table NORTHWIND.' || tabla ||'('
else columna end columna  from (
select  c.table_name tabla,column_name|| ' ' || data_type || ' (' || c.data_length || '),'  columna,
row_number() over( partition by  c.table_name order by column_name ) fila
from dba_tab_cols c 
inner join dba_objects o
on c.owner=o.owner
and c.table_name =o.object_name
where  c.owner='NORTHWIND'
) cp

---------------------------COPY TO ORACLE-------------------------------
CREATE TABLE TABLA AS
SELECT * FROM CUSTIME