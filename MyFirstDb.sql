#MyFirstDB


#Example 
/*
create table new_schema.table_name
(
	column_1 int
		constraint table_name_pk_2
			primary key,
	column_2 int
		constraint table_name___fk
			references ??? ("")
				on update cascade on delete cascade,
	column_3 int,
	column_4 int,
	column_5 int,
	column_6 serial not null,
	column_7 int
);


create unique index table_name_column_6_uindex
	on new_schema.table_name (column_6);

alter table new_schema.table_name
	add constraint table_name_pk
		unique (column_6);
*/


CREATE DATABASE MyFirst;

CREATE SCHEMA Schema1;

CREATE TABLE Schema1.teachers1
(
  id         bigserial,
  first_name varchar(25),
  last_name  varchar(50),
  school     varchar(50),
  hire_date  date,
  salary     numeric
);