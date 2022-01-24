DROP DATABASE IF EXISTS  multinacional;
CREATE DATABASE multinacional;
USE multinacional;

CREATE TABLE tipo
(
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
	nombre VARCHAR (30),
	CONSTRAINT pk_tipo
	PRIMARY KEY (id));

create table empresa
(
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (30) NOT NULL,
    direccion VARCHAR (50),
    codTipo BIGINT UNSIGNED,
	CONSTRAINT pk_empresa
	PRIMARY KEY (id), 
    CONSTRAINT fk_tipo
    FOREIGN KEY (codTipo) REFERENCES tipo (id));
    
CREATE TABLE departamento
(
    id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (30) NOT NULL,
    CONSTRAINT pk_departamento
    PRIMARY KEY (id));
    
CREATE TABLE empleado
(
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    dni CHAR (9) NOT NULL,
    nombre VARCHAR (30),
    telefono CHAR (9),
    CONSTRAINT pk_empleado
    PRIMARY KEY (id));
    
CREATE TABLE empresaDep
(
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
	codEmpresa BIGINT UNSIGNED, 
	codDepartamento BIGINT UNSIGNED,
	CONSTRAINT pk_Empdep
	PRIMARY KEY (id),
	CONSTRAINT fk_empresa
	FOREIGN KEY (codEmpresa) REFERENCES empresa (id),
	CONSTRAINT fk_depempresa
	FOREIGN KEY (codDepartamento) REFERENCES departamento (id));

CREATE TABLE empleadodep
(
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
	codEmpleado BIGINT UNSIGNED,
	codDepartamento BIGINT UNSIGNED,
	cargo VARCHAR (40)  NOT NULL,
	CONSTRAINT pk_empdep
	PRIMARY KEY (id),
	CONSTRAINT fk_empleado
	FOREIGN KEY (codEmpleado) REFERENCES empleado (id),
	CONSTRAINT fk_depempleado
	FOREIGN KEY (codDepartamento) REFERENCES departamento (id));