	drop database if exists School_Box;
create database School_Box;
show databases;
use School_Box;

create table USUARIO(
	Id_U int auto_increment not null primary key,
	Nombre_U nvarchar(50),
    Instituto_U nvarchar(100),
	Contrasena_U nvarchar(20),
	Correo_U nvarchar (30)
);
describe USUARIO;


create table FORO(
	Id_F int not null primary key,
	Nombre_F nvarchar(50),
	Participantes_F int not null,
    Puntuacion_F int not null
);

create table FAQ (
	ID_FAQ int not null primary key auto_increment,
	P_FAQ nvarchar(300) not null,
	R_FAQ nvarchar(300) not null,
    E_FAQ nvarchar(20) not null
);

create table PREGUNTA (
	Id_Pregunta int not null primary key auto_increment,
	Nombre_F nvarchar(50) not null,
	Nombre_U nvarchar(50) not null,
    Pregunta text
);
/*
create table RESPUESTAS (
	Id_Respuesta int not null primary key auto_increment,
	Nombre_Foro nvarchar(50) not null,
	Nombre_Usuario nvarchar(50) not null,
    Id_Pregunta int not null,
    Respuesta text
);
*/

create table FOROS_HECHOS(
	Id_FH int auto_increment not null,
	Id_F int not null,
	Id_U int not null,
	primary key (Id_FH),
	foreign key(Id_F) references FORO(Id_F),
    foreign key(Id_U) references USUARIO(Id_U)
	on delete cascade on update cascade
);
describe FOROS_HECHOS;

create table MIS_FOROS(
	Id_MF int auto_increment not null,
	Id_F int not null,
	Id_U int not null,
	primary key(Id_MF),
    Nombre_U nvarchar(50),
    Nombre_F nvarchar(50),
	foreign key (Id_F) references FORO (Id_F),
	foreign key(Id_U) references USUARIO(Id_U)
	on delete cascade on update cascade
);
describe MIS_FOROS;
/*
create table 	MIS_PREGUNTAS(
	Id_P int auto_increment not null,
	Id_Respuea int not null,
	foreign key (Id_Pregunta) references PREGUNTA (Id_Pregunta),
	foreign key(Id_Respuesta) references RESPUESTAS(Id_Respuesta)
	on delete cascade on update cascade
);  */

insert into USUARIO values
(100,'VictorHG','Centro de Estudios Cientificos Y Tecnologicos 9','vec71$','vectorhg71@gmail.com'),
(101,'Roman','Centro de Estudios Cientificos Y Tecnologicos 9','transf0#','esteban.mtz@gmail.com'),
(102,'Luidicho','CONALEP','clasroya1@','luis.valle@gmail.com'),
(103,'DanMac','Centro de Estudios Cientificos Y Tecnologicos 9','omegle34','art.mac@gmail.com');

insert into FAQ values
(001,'¿Porqué la creación de una plataforma más simple que las actuales que se encuentran en el mercado?','Respuesta1','Aceptada'),
(002,'¿Cómo funcionan los foros o grupos de estudio en un ambiente escolar movido donde tengo que organizarme con mis materias y mis compañeros?','Respuesta2','Aceptada'),
(003,'¿Qué es School-Box?','Respuesta3','Aceptada'),
(004,'¿Porqué la creación de una plataforma más simple que las actuales que se encuentran en el mercado?','Respuesta4','Aceptada'),
(005,'¿Cómo se pueden enviar archivos multimedia en los foros?','Sin Respuesta','Denegada');

insert into FORO values
(10,'Calculo Integral',23, 100),
(20,'Biologia Organica',18,90),
(30,'Fisica III',35,50),
(40,'Calculo Avanzado',24,30),
(50,'Calculo Diferencial',18,90),
(60,'Fisica II',35,50),
(70,'Calculo para Principiantes',24,30),
(80,'Biologia Inorganica',18,90),
(90,'Artes Modernas',35,50),
(100,'Artes Plasticas',24,30),
(110,'Artes',42,80);

insert into PREGUNTA values
(01,'Calculo Integral','VictorHG','Buenas esta es su clase de Calculo Integral'),
(02,'Biologia Organica','VictorHG','Buenas esta es su clase de Biologia Organica'),
(03,'Fisica III','VictorHG','Buenas,  esta es su clase de Fisica III'),
(04,'Calculo Avanzado','VictorHG','Buenas esta es su clase de Calculo Avanzado'),
(05,'Calculo Integral','Luidicho','Cuando se Entrega el PA?'),
(06,'Calculo Integral','Roman','La Proxima Clase'),
(07,'Calculo Diferencial','VictorHG','Buenas esta es su clase de Calculo Diferencial'),
(08,'Calculo Integral','Roman','Hola'),
(09,'Fisica II','Luidicho','Buenas esta es su clase de Fisica II');
/*
insert into RESPUESTAS values
(01,'Calculo Integral','Optimus532',01,'Gracias, igualmente'),
(02,'Calculo Integral','VictorHG',05,'Se entrea el miercoles de la siguiente semana'),
(03,'Calculo Integral','VictorHG',06,'Un resumen de algo que nunca enseñe'),
(04,'Calculo Integral','Optimus532',06,'No invente profe'),
(05,'Biologia Organica','DanMac',02,'Gracias, igualmente'),
(06,'Fisica III','Optimus532',03,'Gracias, igualmente'),
(07,'Calculo Diferencial','Luidicho',07,'Gracias, igualmente'),
(08,'Fisica II','DanMac',09,'Gracias, igualmente');

insert into MIS_PREGUNTAS values
(01,01),
(02,05),
(03,06),
(05,02),
(06,03),
(06,04),
(07,07),
(09,08);
*/

insert into MIS_FOROS values
(001,10,100,'VictorHG','Calculo Integral'),
(002,20,100,'VictorHG','Biologia Organica'),
(003,30,100,'VictorHG','Fisica III'),
(004,40,100,'VictorHG','Calculo Avanzado'),
(005,10,101,'Roman','Calculo Integral'),
(006,60,101,'Roman','Fisica II'),
(007,70,101,'Roman','Calculo para Principiantes'),
(008,80,103,'DanMac','Biologia Inorganica'),
(009,20,103,'DanMac','Biologia Organica'),
(010,10,102,'Luidicho','Calculo Integral');

insert into FOROS_HECHOS values
(01,10,103),
(02,20,100),
(03,30,102),
(04,40,101),
(05,20,100),
(06,30,102),
(07,40,101),
(08,50,100);
show tables;
drop view if exists vista_prueba;
create view vista_prueba as

	select Nombre_U,Id_F from USUARIO as u inner join FOROS_HECHOS as fh on fh.Id_U=u.Id_U;
    

		SELECT 
		u.Nombre_U, 
		b.Nombre_F
		FROM FOROS_HECHOS ub
		INNER JOIN USUARIO u ON ub.Id_U =  u.Id_U AND u.Nombre_U != 'VictorHG'
		INNER JOIN FORO b ON ub.Id_F =  b.Id_F
        order by rand();
        
        SELECT 
		u.Nombre_U, 
		b.Nombre_F,
        b.Puntuacion_F
		FROM FOROS_HECHOS ub
		INNER JOIN USUARIO u ON ub.Id_U =  u.Id_U
		INNER JOIN FORO b ON ub.Id_F =  b.Id_F
        order by b.Puntuacion_F desc;
        
		SELECT 
		Nombre_U, 
		Pregunta
		FROM PREGUNTA Where Nombre_F = 'Calculo Integral';

	


        SELECT 
		u.Nombre_U, 
		b.Nombre_F
		FROM MIS_FOROS ub
		INNER JOIN USUARIO u ON ub.Nombre_U =  u.Nombre_U  AND u.Nombre_U =  'VictorHG'
		INNER JOIN FORO b ON ub.Nombre_F =  b.Nombre_F
        ;
		select u.Nombre_U, b.Nombre_F from MIS_FOROS ub INNER JOIN USUARIO u ON ub.Nombre_U =  u.Nombre_U  AND u.Nombre_U =  'VictorHG' INNER JOIN FORO b ON ub.Nombre_F =  b.Nombre_F ;
        select b.Nombre_F from MIS_FOROS ub INNER JOIN USUARIO u ON ub.Nombre_U =  u.Nombre_U  AND u.Nombre_U =  'VictorHG' INNER JOIN FORO b ON ub.Nombre_F =  b.Nombre_F ;
        
        
		select u.Nombre_U, b.Nombre_F, b.Puntuacion_F from FOROS_HECHOS ub INNER JOIN USUARIO u ON ub.Id_U =  u.Id_U INNER JOIN FORO b ON ub.Id_F =  b.Id_F order by b.Puntuacion_F desc;
        select u.Nombre_U, b.Nombre_F from FOROS_HECHOS ub INNER JOIN USUARIO u ON ub.Id_U =  u.Id_U AND u.Nombre_U != 'VictorHG' INNER JOIN FORO b ON ub.Id_F =  b.Id_F order by rand();
        
        
        select Nombre_U, Pregunta FROM PREGUNTA Where Nombre_F = 'Calculo Integral';
        
select Nombre_U from MIS_FOROS;
select *from vista_prueba; 

select * from USUARIO;
select * from PREGUNTA;
select * from FORO;



CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `cargo` (`IDCARGO`, `NOMBRECARGO`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'EDITOR');



CREATE TABLE `empleado` (
  `IDEMPLEADO` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `usuarioagenteditor` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBREUSUARIO` varchar(20) DEFAULT NULL,
  `CLAVE` varchar(10) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `usuarioagenteditor` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`,`IDCARGO`) VALUES
(1, 'ALEXANDER', '123', 1),
(2, 'STEPHANO', '456', 2);


ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);


ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `FK_EMPLEADO_USU` (`IDUSUARIO`);

ALTER TABLE `usuarioagenteditor`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_USUARIO_CARGO` (`IDCARGO`);


ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `empleado`
  MODIFY `IDEMPLEADO` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `usuarioagenteditor`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USU` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarioagenteditor` (`IDUSUARIO`);

ALTER TABLE `usuarioagenteditor`
  ADD CONSTRAINT `FK_USUARIO_CARGO` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`IDCARGO`);
COMMIT;