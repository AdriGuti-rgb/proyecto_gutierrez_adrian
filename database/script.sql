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
    poblation VARCHAR(50),
    main_photo VARCHAR(100),
    id_category VARCHAR(20),
    id_modality VARCHAR(20),
    FOREIGN KEY (id_category) REFERENCES categories(id),
    FOREIGN KEY (id_modality) REFERENCES modalities(id) 
);

CREATE TABLE older_clasifications (
    id VARCHAR(20) PRIMARY KEY,
    winner VARCHAR (40),
    second_place VARCHAR(40),
    third_place VARCHAR(40),
    year DATE,
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

insert into users (id, name, username, mail, pass, city, photo) values ('34u9nrz02jm9', 'Amitie Ivakhin', 'aivakhin0', 'aivakhin0@unesco.org', 'uA8~qbeXEH9c_N', 'Agpangi', 'CubiliaCurae.doc');
insert into users (id, name, username, mail, pass, city, photo) values ('27c2vmc10aj8', 'Florence Stanning', 'fstanning1', 'fstanning1@toplist.cz', 'iT5*c+(.3c=', 'Yangping', 'SodalesScelerisque.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('33c8ozw26lm4', 'Yasmin Ridgway', 'yridgway2', 'yridgway2@earthlink.net', 'mG4{h*XX)bR,g#VL', 'Piru', 'Sem.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('94h6fek22jo8', 'Nahum Densumbe', 'ndensumbe3', 'ndensumbe3@nih.gov', 'dB2}`(Lz>(2', 'Pavlodar', 'VitaeNisl.png');
insert into users (id, name, username, mail, pass, city, photo) values ('45x5mzz92bu9', 'Dniren Ambrodi', 'dambrodi4', 'dambrodi4@bing.com', 'qF4{w?_''n9Y`txHJ', 'Iset’', 'MassaId.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('50f8auj98du5', 'Baxy Lesek', 'blesek5', 'blesek5@reuters.com', 'eA8<?NSp', 'Toledo', 'AliquamQuisTurpis.tiff');
insert into users (id, name, username, mail, pass, city, photo) values ('81m5tmf28qw1', 'Tisha Coultard', 'tcoultard6', 'tcoultard6@meetup.com', 'tN9''kP8Pl3yt<U$', 'Winong', 'LigulaPellentesque.txt');
insert into users (id, name, username, mail, pass, city, photo) values ('43f1cvn19wt5', 'Dillon Downer', 'ddowner7', 'ddowner7@sun.com', 'bD2=vdCm}j<+V', 'Heichengzi', 'NamDuiProin.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('10l9szo17cl2', 'Enrique Greave', 'egreave8', 'egreave8@ameblo.jp', 'pF7./~f?', 'Norrköping', 'Duis.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('97l8pkq38ua6', 'Crysta Colvin', 'ccolvin9', 'ccolvin9@samsung.com', 'iX9}@Wl.', 'Rikitgaib', 'AeneanLectus.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('79z4mem64zn8', 'Terrence Maffin', 'tmaffina', 'tmaffina@ox.ac.uk', 'pB3<H2Jmrsdstu<C', 'Parque Industrial', 'ConvallisNullaNeque.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('01u1hhj50ya7', 'Tyne Scimonelli', 'tscimonellib', 'tscimonellib@epa.gov', 'fF2/<C7k.F.ZV3a', 'Okinawa Número Uno', 'AugueLuctus.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('40r1vby21ca7', 'Nicolle Gason', 'ngasonc', 'ngasonc@cloudflare.com', 'tO6,4"sw.$eP#', 'Qinglin', 'Diam.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('27l5rfe75ug3', 'Sunny Dumsday', 'sdumsdayd', 'sdumsdayd@discovery.com', 'kN0,mgsucyP', 'Ciudad Nueva', 'Phasellus.gif');
insert into users (id, name, username, mail, pass, city, photo) values ('30b2kjh47zx1', 'Konstantine McElmurray', 'kmcelmurraye', 'kmcelmurraye@about.me', 'mW3<>T9=mZQJmIa', 'Luoshanchuan', 'Luctus.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('43k2ukv87om2', 'Russ Jessel', 'rjesself', 'rjesself@xinhuanet.com', 'pI2&NJY9D8)M', 'Taupo', 'Fusce.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('63d8iew33xv3', 'Dougie Maliffe', 'dmaliffeg', 'dmaliffeg@abc.net.au', 'rG0!zTH8w', 'Sérvia', 'HabitassePlateaDictumst.gif');
insert into users (id, name, username, mail, pass, city, photo) values ('38l8cmo24jw8', 'Dillie Lebourn', 'dlebournh', 'dlebournh@canalblog.com', 'lP0<y0vBOcDpO6', 'Yelwa', 'VestibulumSitAmet.avi');
insert into users (id, name, username, mail, pass, city, photo) values ('54o1jnk44qq6', 'Tamas Terne', 'tternei', 'tternei@boston.com', 'sH1,5tr,&OBX', 'Jiuzhou', 'PharetraMagna.mov');
insert into users (id, name, username, mail, pass, city, photo) values ('74w6wut98le6', 'Horatio Sang', 'hsangj', 'hsangj@xrea.com', 'nN5`_!3DD,', 'Boca Suno', 'OrciEgetOrci.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('62z4wij91uu5', 'Ursula Danilyuk', 'udanilyukk', 'udanilyukk@archive.org', 'uB5?vfgO', 'Windsor', 'TempusVel.avi');
insert into users (id, name, username, mail, pass, city, photo) values ('80a4fhh44ht7', 'Marys Tapin', 'mtapinl', 'mtapinl@aol.com', 'uD7}cd#IEN', 'Sala', 'OrciNullamMolestie.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('46j8acx76ib2', 'Tamqrah Eich', 'teichm', 'teichm@sourceforge.net', 'aL7}ahL_=hRbV,6', 'Tuanalepe', 'CongueElementum.tiff');
insert into users (id, name, username, mail, pass, city, photo) values ('08k0uxn29kd5', 'Ad Kingscote', 'akingscoten', 'akingscoten@surveymonkey.com', 'zE4>%oo?(w', 'Cluses', 'Euismod.txt');
insert into users (id, name, username, mail, pass, city, photo) values ('03u7cup02ed1', 'Jaclyn Sevin', 'jsevino', 'jsevino@sphinn.com', 'sY2~UEE1g%V/', 'Cabog', 'Gravida.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('46u2bmo31ae9', 'Jayme McKea', 'jmckeap', 'jmckeap@berkeley.edu', 'kA7}B@3`&jso', 'Rushankou', 'EgetSemperRutrum.png');
insert into users (id, name, username, mail, pass, city, photo) values ('64r6qgh43bv4', 'Margaux McClurg', 'mmcclurgq', 'mmcclurgq@wix.com', 'iQ0\Hn=Ag', 'Wangi', 'Vivamus.doc');
insert into users (id, name, username, mail, pass, city, photo) values ('20a6zua96se1', 'Paulette Eastway', 'peastwayr', 'peastwayr@bloomberg.com', 'uA9,bvFu', 'Kudusan', 'NonInterdum.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('16t6mqi26fm5', 'Chuck Chippin', 'cchippins', 'cchippins@newyorker.com', 'tA0@i>9pA', 'Sulengwaseng', 'NecDui.avi');
insert into users (id, name, username, mail, pass, city, photo) values ('01k3bcp67tw0', 'Barbette Crackel', 'bcrackelt', 'bcrackelt@archive.org', 'kV8)H\wR', 'Kompóti', 'Sodales.mov');
insert into users (id, name, username, mail, pass, city, photo) values ('28s7fcv53io5', 'Leonhard Ranger', 'lrangeru', 'lrangeru@wp.com', 'gG1_4Y~Ir.''y.WzB', 'Asahikawa', 'Semper.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('19d9yaz40qn3', 'Elwira Blundell', 'eblundellv', 'eblundellv@kickstarter.com', 'cE0,*b)8+L<"ZM|', 'Jamban', 'VariusInteger.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('76i3jwb46fi7', 'Bess Fellowes', 'bfellowesw', 'bfellowesw@google.nl', 'zG3*?0O&rlKx!wX8', 'Pingshan', 'OrciNullamMolestie.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('60b7djg91ix8', 'Dionne Ballendine', 'dballendinex', 'dballendinex@salon.com', 'oW4}Yob''K=u', 'Chengcun', 'Ullamcorper.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('38a6kvs39nm9', 'Mallissa Swaden', 'mswadeny', 'mswadeny@cmu.edu', 'fM4*.eYI%x&xZG', 'Maumbawa', 'Molestie.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('98c8dzl95nm6', 'Marianna Aingel', 'maingelz', 'maingelz@addtoany.com', 'mH3!t#S<#V8<&NVy', 'Niba', 'ConvallisEgetEleifend.avi');
insert into users (id, name, username, mail, pass, city, photo) values ('47a8ogv64xq9', 'Fan Beckley', 'fbeckley10', 'fbeckley10@cnbc.com', 'dX0\0T3mH', 'Luohuang', 'Eu.tiff');
insert into users (id, name, username, mail, pass, city, photo) values ('25e5ugr60sh7', 'Hadley MacKeeg', 'hmackeeg11', 'hmackeeg11@examiner.com', 'dC5.S9nOp}KK9', 'Ingenio', 'Metus.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('52v2uph05kw9', 'Ronni Osgar', 'rosgar12', 'rosgar12@php.net', 'lX7@dow""KnzaV', 'Bryukhovetskaya', 'PedeUllamcorperAugue.tiff');
insert into users (id, name, username, mail, pass, city, photo) values ('75o4mgj05di0', 'Ardelis Ubank', 'aubank13', 'aubank13@independent.co.uk', 'lI8(!gD#8_isw@8w', 'Sandia', 'AliquamSitAmet.doc');
insert into users (id, name, username, mail, pass, city, photo) values ('48f2nwy13wi6', 'Merilee Williscroft', 'mwilliscroft14', 'mwilliscroft14@hubpages.com', 'dT0.}9rR', 'Lebak Timur', 'Nascetur.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('86z3rey98ev1', 'Chanda Schimann', 'cschimann15', 'cschimann15@jugem.jp', 'eF4|Rk#ADxj', 'Shatian', 'IdMauris.mov');
insert into users (id, name, username, mail, pass, city, photo) values ('02z0msn65mm6', 'Sax Records', 'srecords16', 'srecords16@newyorker.com', 'xW3+Mq5Y', 'Mlonggo', 'Commodo.mpeg');
insert into users (id, name, username, mail, pass, city, photo) values ('77h7unt30sz6', 'Morganne Burkhill', 'mburkhill17', 'mburkhill17@ed.gov', 'nZ2+dl''iG|awS!rJ', 'Hedong', 'Ultrices.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('00m2ydk04bw9', 'Johannah Mendenhall', 'jmendenhall18', 'jmendenhall18@nyu.edu', 'tM1)+~uT', 'Bautista', 'OdioCondimentum.doc');
insert into users (id, name, username, mail, pass, city, photo) values ('05v5pue19ri3', 'Dorie Brookbank', 'dbrookbank19', 'dbrookbank19@merriam-webster.com', 'lV6$I$1Y.', 'Ichnya', 'AmetCursusId.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('78m3mda58mq5', 'Karoly Di Filippo', 'kdi1a', 'kdi1a@delicious.com', 'pU5,7sar?weN', 'Carcassonne', 'Justo.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('98q3igw21je1', 'Edita Pea', 'epea1b', 'epea1b@nba.com', 'nY2?g{"V3', 'Antipino', 'OrciLuctusEt.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('11r4evu52mf4', 'Alphonso Bulteel', 'abulteel1c', 'abulteel1c@sun.com', 'oE8$*y2wzSWx$=8@', 'Fort Portal', 'Enim.doc');
insert into users (id, name, username, mail, pass, city, photo) values ('72c2xlb32zs1', 'Aurlie Volleth', 'avolleth1d', 'avolleth1d@sciencedirect.com', 'gK4@yzEaQY#Gdn', 'Sucha', 'VelEnimSit.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('75k8qfv99ug9', 'Rowland Pimblott', 'rpimblott1e', 'rpimblott1e@edublogs.org', 'eP7)4w_uIyrdMoH', 'Umunede', 'Accumsan.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('55y8ynp48av0', 'Rickie Sylett', 'rsylett1f', 'rsylett1f@yahoo.com', 'dV1)Ie*{@', 'Capitán Bermúdez', 'Nibh.ppt');
insert into users (id, name, username, mail, pass, city, photo) values ('61z6lqu58gh2', 'Anatole Filippyev', 'afilippyev1g', 'afilippyev1g@ted.com', 'fT7}epZ\!g`', 'Canomoy', 'ElementumNullam.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('98f1cch86ro4', 'Spike Philip', 'sphilip1h', 'sphilip1h@shareasale.com', 'kV3#8''`}ZK', 'Ternopil’', 'AugueAliquamErat.mpeg');
insert into users (id, name, username, mail, pass, city, photo) values ('74b6tho53sb6', 'Elisabet Woodcroft', 'ewoodcroft1i', 'ewoodcroft1i@taobao.com', 'fL7''rtt!3qxa_jq', 'Vallenar', 'EstQuam.gif');
insert into users (id, name, username, mail, pass, city, photo) values ('38k1ysu20vs9', 'Linus Pudden', 'lpudden1j', 'lpudden1j@ox.ac.uk', 'uV4`J`l>XkakIrS', 'Armanāz', 'AnteVivamusTortor.tiff');
insert into users (id, name, username, mail, pass, city, photo) values ('21f9mlp90pp7', 'Abba Dyneley', 'adyneley1k', 'adyneley1k@forbes.com', 'gI3?DgP/_w+u', 'Hupalivka', 'Suspendisse.xls');
insert into users (id, name, username, mail, pass, city, photo) values ('41g0ayn92yv8', 'Lauren Crush', 'lcrush1l', 'lcrush1l@businessweek.com', 'lC6}Srev<ig', 'Cayungnan', 'UtTellusNulla.mp3');
insert into users (id, name, username, mail, pass, city, photo) values ('72z7tbf49ix6', 'Roselia Kempshall', 'rkempshall1m', 'rkempshall1m@miibeian.gov.cn', 'hS2=Wyr~|RClVi', 'Disina', 'ProinEu.gif');
insert into users (id, name, username, mail, pass, city, photo) values ('51k2hrk92uf2', 'Nyssa Le feuvre', 'nle1n', 'nle1n@virginia.edu', 'xH3.gP}GS!TS1', 'Mendenrejo', 'Dolor.avi');


insert into organizers (id_user, phone, club) values ("03u7cup02ed1", '332041931', 'Yakitri');
insert into organizers (id_user, phone, club) values ("33c8ozw26lm4", '319016751', 'Twitterlist');
insert into organizers (id_user, phone, club) values ("52v2uph05kw9", '391937757', 'Eare');
insert into organizers (id_user, phone, club) values ("78m3mda58mq5", '593565302', 'Livefish');
insert into organizers (id_user, phone, club) values ("20a6zua96se1", '421778885', 'Skidoo');
insert into organizers (id_user, phone, club) values ("41g0ayn92yv8", '280330464', 'Livetube');
insert into organizers (id_user, phone, club) values ("98q3igw21je1", '574537325', 'Aimbo');
insert into organizers (id_user, phone, club) values ("11r4evu52mf4", '506612747', 'Quinu');
insert into organizers (id_user, phone, club) values ("46u2bmo31ae9", '027814386', 'Blognation');
insert into organizers (id_user, phone, club) values ("64r6qgh43bv4", '459286091', 'Trudeo');



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