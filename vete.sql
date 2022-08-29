CREATE DATABASE veterinaria;
drop database veterinaria;
use veterinaria ;
 CREATE TABLE dueno (
 dni int not null primary key,
 nombre varchar(50) not null,
 apellido varchar(50) not null,
 telefono varchar(15)not null
 );
					
drop table perro; 
 CREATE TABLE perro(
 id_perro int not null auto_increment primary key,
 nombre varchar(50) not null,
 fecha_nac date not null,
 sexo varchar(50) not null,
 dni_dueno int not null,
 foreign key(dni_dueno) references dueno(dni)
 );
 
 CREATE TABLE  historial(
 id_historial int not null auto_increment primary key,
 fecha date not null,
 perro int not null,
 descripcion varchar(50) not null,
 monto double not null,
 foreign key(perro) references perro(id_perro)
 );
 
select * from dueno;
insert into dueno value (30571531,"Juan","Gomez","2615558974");
insert into dueno value (25123698,"Luis","GOnzalez","4397885");
insert into dueno value (34528782,"Daniel","Peralta","4215674");
insert into dueno value (17854236,"Alberto","Catano","4789652");
insert into dueno value (19658746,"Luciano","Zamora","4741202");


insert into perro value(1,"firulai", '2021-06-25',"macho",30571531);
insert into perro value(2,"Bobis",'2010-12-10',"Macho",17854236);
insert into perro value(3,"Firulai",'2019-11-05',"Macho",34528782);
insert into perro value(4,"Vita",'2021-3-09',"Hembra",25123698);
insert into perro value(5,"Manala",'2019-11-23',"Hembra",32571531);
insert into perro value(6,"Bronco",'2021-02-28',"Macho",19658746);
select * from perro;

 


insert into historial value(1,'2021-02-19',5,'Se coloca vacuna y realiza bañado',1750.00);
insert into historial value(2,'2022-06-29',3,'Bañado y peinado',3600.00);
insert into historial value(3,'2022-03-05',5,'Corte pelo y uñas',1750.00);
insert into historial value(4,'2021-09-1',5,'Se coloca vacuna y pipeta ',1750.00);
insert into historial value(5,'2021-09-1',2,'Se coloca vacuna y pipeta ',1750.00);
insert into historial value(6,'2021-09-1',2,'Se coloca vacuna y pipeta ',1750.00);
select *  from historial;

select   historial.perro as "ID",perro.nombre, historial.descripcion , historial.monto  from perro
join historial on historial.perro= perro.id_perro
;
-- ejercicio 1 --
select * from historial
where fecha<"2022-01-01";

delete from historial
where fecha="2021-09-01" and id_historial=6 ; 
-- ejercicio 2 update fecha_nac --
select * from perro;
update perro
set fecha_nac ="2022-05-07" 
where id_perro=4;

-- consulta doble tabla / todos los perros a cargo de una persona --
select * from perro;
select * from dueno;
select perro.nombre,dueno.nombre from perro
join dueno on perro.dni_dueno= dueno.dni;