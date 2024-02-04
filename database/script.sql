DROP DATABASE IF EXISTS proyecto_integrador;

CREATE DATABASE proyecto_integrador;

USE proyecto_integrador;

CREATE TABLE users (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    username VARCHAR(30) UNIQUE,
    mail VARCHAR(100) UNIQUE,
    pass VARCHAR(16) UNIQUE,
    city VARCHAR(40),
    photo VARCHAR(100)
);

CREATE TABLE organizers (
    id_user VARCHAR(20) PRIMARY KEY,
    phone FLOAT(9),
    club VARCHAR(100),
    FOREIGN KEY (id_user) REFERENCES users(id)
);


CREATE TABLE services (
    id VARCHAR(20) PRIMARY KEY,
    type VARCHAR(40)
);

CREATE TABLE categories (
    id VARCHAR(20) PRIMARY KEY,
    type VARCHAR(40),
    ages VARCHAR(6)
);

CREATE TABLE modalities (
    id VARCHAR(20) PRIMARY KEY,
    type VARCHAR(40),
    first_prize FLOAT(5),
    second_prize FLOAT(5),
    third_prize FLOAT(5)
);

CREATE TABLE races (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(60),
    race_day DATE,
    positive_slope FLOAT,
    negative_slope FLOAT,
    total_slope FLOAT,
    distance FLOAT,
    poblation VARCHAR(50),
    main_photo VARCHAR(100),
    regulation VARCHAR(20),
    webRef VARCHAR(20),
    coor LONGTEXT,
    id_category VARCHAR(20),
    id_modality VARCHAR(20),
    id_organizer VARCHAR(20),
    FOREIGN KEY (id_category) REFERENCES categories(id),
    FOREIGN KEY (id_modality) REFERENCES modalities(id),
    FOREIGN KEY (id_organizer) REFERENCES organizers(id_user) 
);

CREATE TABLE older_clasifications (
    id VARCHAR(20) PRIMARY KEY,
    winner VARCHAR (40),
    second_place VARCHAR(40),
    third_place VARCHAR(40),
    year_race DATE,
    time_race TIME,
    id_race VARCHAR(20),
    FOREIGN KEY (id_race) REFERENCES races(id) 
);

CREATE TABLE favourites (
    id_user VARCHAR(20),
    id_race VARCHAR(20),
    PRIMARY KEY (id_user, id_race),
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_race) REFERENCES races(id)
);

CREATE TABLE races_services (
    id_race VARCHAR(20),
    id_service VARCHAR(20),
    PRIMARY KEY (id_race, id_service),
    FOREIGN KEY (id_race) REFERENCES races(id),
    FOREIGN KEY (id_service) REFERENCES services(id)
);

CREATE TABLE older_photos (
    id VARCHAR(20) PRIMARY KEY,
    url VARCHAR(500),
    id_race VARCHAR(20),
    FOREIGN KEY (id_race) REFERENCES races(id)
);

insert into modalities () values ('01j5gic48lj6', "Cross Country", 298.0, 163.62, 132.19);
insert into modalities () values ('43o0aja32wa6', "Trail Running", 291.98, 243.82, 96.03);
insert into modalities () values ('00p9ajk35ew0', "Maraton", 291.77, 152.0, 142.55);
insert into modalities () values ('99r4osm75ys5', "Ultra Maraton", 262.42, 166.19, 135.83);

insert into services () values ('64s5stg45yh4', "Avituallamiento solido");
insert into services () values ('55h1ngq99rc1', "Avituallamiento liquido");
insert into services () values ('89p0gjq46ll5', "Puestos de socorro");
insert into services () values ('14n1hrj58qz8', "Zonas ecologicas");
insert into services () values ('12b6hah53jc9', "Tiempos intermedios");
insert into services () values ('61c0bcg91ac2', "Parking");



insert into categories () values ("02f8wll37kw4", "Cadete Masculino", "15-17");
insert into categories () values ("04g4fhb62fn9", "Cadete Femenino", "15-17");
insert into categories () values ("20g9ofq49jj1", "Junior Masculino", "18-20");
insert into categories () values ("20s0tqp46hc5", "Junior Femenino", "18-20");
insert into categories () values ("24q4jjp22ue1", "Senior Masculino", "21");
insert into categories () values ("41e1khc20eh1", "Senior Femenino", "21");
insert into categories () values ("62r1uem02dl2", "Promesa Masculino", "21-39");
insert into categories () values ("63b1rvo95yo8", "Promesa Femenino", "21-39");
insert into categories () values ("75g8gux37hj6", "Veterana A Masculino", "40-51");
insert into categories () values ("76d0jcz21ba6", "Veterana A Femenino", "40-51");
insert into categories () values ("84c4uht30ds9", "Veterana B Masculino", ">51");
insert into categories () values ("88f6jqs30yu7", "Veterana B Femenino", ">51");