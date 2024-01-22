DROP DATABASE IF EXISTS ejercicio17;
CREATE DATABASE ejercicio17;
USE ejercicio17;

CREATE TABLE departamentos(
id INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(30), 
descripcion VARCHAR(200)
);

CREATE TABLE categorias_departamento(
id INT PRIMARY KEY AUTO_INCREMENT, 
categoria VARCHAR(20), 
id_departamento INT NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE trabajadores(
id INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(30), 
apellidos VARCHAR(50), 
dni CHAR(11), 
fecha_nacimiento DATE
);

CREATE TABLE gerentes(
id_trabajador INT PRIMARY KEY, 
fecha_alta DATE,
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id)
);

CREATE TABLE jefes(
id_trabajador INT PRIMARY KEY, 
id_departamento INT NOT NULL,
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id),
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE gerente_jefe(
id_gerente INT, 
id_jefe INT,
FOREIGN KEY(id_jefe) REFERENCES jefes(id_trabajador),
FOREIGN KEY(id_gerente) REFERENCES gerentes(id_trabajador),
PRIMARY KEY(id_gerente, id_jefe)
);

CREATE TABLE titulaciones_jefes(
id INT PRIMARY KEY AUTO_INCREMENT, 
titulacion VARCHAR(30), 
id_jefe INT NOT NULL,
FOREIGN KEY(id_jefe) REFERENCES jefes(id_trabajador)
);

CREATE TABLE vendedores(
id_trabajador INT PRIMARY KEY, 
bonificacion FLOAT, 
ganancia_ventas FLOAT, 
id_departamento INT NOT NULL,
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id),
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE jefe_vendedor(
id_jefe INT, 
id_vendedor INT,
PRIMARY KEY(id_jefe, id_vendedor),
FOREIGN KEY(id_jefe) REFERENCES jefes(id_trabajador),
FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_trabajador)
);

CREATE TABLE productos(
id INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(40), 
codigo_barras VARCHAR(30) NOT NULL, 
precio FLOAT, 
id_departamento INT NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE clientes(
id INT PRIMARY KEY AUTO_INCREMENT, 
dni CHAR(10), 
nombre VARCHAR(30) NOT NULL, 
apellidos VARCHAR(50)
);

CREATE TABLE intereses_clientes(
id INT PRIMARY KEY AUTO_INCREMENT, 
interes VARCHAR(40) NOT NULL, 
id_cliente INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE ventas(
id INT PRIMARY KEY AUTO_INCREMENT, 
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
precio_total FLOAT, 
cantidad_producto INT, 
id_vendedor INT NOT NULL,
id_producto INT NOT NULL, 
id_cliente INT NOT NULL,
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_trabajador),
FOREIGN KEY (id_producto) REFERENCES productos(id),
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);