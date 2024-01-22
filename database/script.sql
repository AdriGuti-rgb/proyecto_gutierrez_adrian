DROP DATABASE IF EXISTS proyecto_integrador;

CREATE DATABASE proyecto_integrador;

USE proyecto_integrador;

CREATE TABLE users (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    username VARCHAR(30) UNIQUE,
    mail VARCHAR(100),
    pass VARCHAR(16),
    city VARCHAR(40),
    phone FLOAT(9) DEFAULT NULL,
    club VARCHAR(100) DEFAULT NULL,
    photo VARCHAR(100),
    rol ENUM("User", "Organizer")
);

CREATE TABLE races (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    categories ENUM("Cadete", "Junior", "Sénior", "Promesa", "Veterana A", "Veterana B"),
    total_slope FLOAT,
    positive_slope FLOAT,
    negative_slope FLOAT,
    poblation VARCHAR(50),
    main_photo VARCHAR(100),
    race_day DATE,
    distance ENUM("8", "9", "21", "80", "34", "12"),
    services VARCHAR(100),
    modality ENUM("Trail", "Maratón", "Media Maratón", "Vertical", "Ultra"),
    older_photos VARCHAR(200)
);


insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Matsoft', 'Sénior', 1346.2, 185.46, 597.18, 'Linchen', 34, 'Puestos de socorro', 'Trail', '2024/06/04');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Veterana A', 896.78, 162.64, 1381.35, 'Esil', 34, 'Avituallamiento líquido', 'Maratón', '2024/03/20');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Keylex', 'Promesa', 3744.74, 658.71, 1230.78, 'Udi', 21, 'Tiempos intermedios', 'Trail', '2024/08/28');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Mat Lam Tam', 'Promesa', 2714.96, 753.2, 268.93, 'Desa Wetan Ciakar', 9, 'TIempo final', 'Ultra', '2024/01/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Sonair', 'Junior', 1479.76, 996.36, 698.45, 'Shahrīār', 12, 'Parking', 'Trail', '2024/06/20');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Andalax', 'Cadete', 1533.89, 258.57, 745.28, 'Muara Sabak', 80, 'Avituallamiento líquido', 'Media Maratón', '2024/10/12');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bitchip', 'Cadete', 1805.68, 740.61, 571.82, 'Ferapontovo', 8, 'Avituallamiento líquido', 'Ultra', '2024/09/14');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Stim', 'Junior', 719.21, 221.57, 307.43, 'Cabuyao', 9, 'Puestos de socorro', 'Trail', '2024/03/20');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Subin', 'Junior', 3700.57, 170.58, 1384.8, 'Pocsi', 21, 'Avituallamiento líquido', 'Media Maratón', '2024/06/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Y-Solowarm', 'Veterana A', 2199.75, 322.42, 1425.2, 'Międzyzdroje', 8, 'Tiempos intermedios', 'Media Maratón', '2024/03/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Prodder', 'Veterana B', 1966.63, 273.96, 571.69, 'Gangmei', 34, 'Avituallamiento sólido', 'Maratón', '2024/09/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Ronstring', 'Cadete', 2186.11, 1368.25, 1474.53, 'Kangshan', 80, 'Tiempos intermedios', 'Trail', '2024/04/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Greenlam', 'Sénior', 596.76, 254.12, 406.45, 'Florencia', 8, 'Avituallamiento líquido', 'Vertical', '2024/07/18');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bitwolf', 'Sénior', 1608.23, 831.53, 1309.06, 'Bente', 9, 'Puestos de socorro', 'Vertical', '2024/03/06');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Lotstring', 'Sénior', 1581.03, 589.11, 1242.59, 'San Rafael', 80, 'Avituallamiento líquido', 'Trail', '2024/03/26');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Otcom', 'Sénior', 3984.72, 240.72, 806.53, 'Victoria', 34, 'Avituallamiento sólido', 'Trail', '2024/08/18');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Fixflex', 'Veterana A', 1108.73, 709.01, 101.96, 'Srinagarindra', 80, 'Puestos de socorro', 'Vertical', '2024/12/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Rank', 'Veterana B', 3446.28, 529.6, 244.72, 'Kula', 34, 'Zonas ecológicas', 'Trail', '2024/04/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bitwolf', 'Cadete', 1618.4, 548.38, 773.55, 'Kruengraya', 9, 'Tiempos intermedios', 'Maratón', '2024/09/02');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Job', 'Sénior', 2798.41, 972.94, 1087.72, 'Tiandiba', 12, 'Tiempos intermedios', 'Maratón', '2024/01/26');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Home Ing', 'Junior', 740.83, 1168.05, 1411.62, 'Karantaba', 34, 'Tiempos intermedios', 'Trail', '2024/02/29');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tresom', 'Junior', 1373.46, 935.36, 258.41, 'Obrera', 12, 'Puestos de socorro', 'Ultra', '2024/07/12');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Duobam', 'Sénior', 2678.05, 1305.58, 151.16, 'Cishan', 21, 'Parking', 'Vertical', '2024/11/07');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Flowdesk', 'Veterana B', 2646.75, 1235.13, 382.31, 'Flagstaff', 12, 'TIempo final', 'Ultra', '2024/07/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bitwolf', 'Veterana B', 1839.3, 717.52, 478.8, 'Đắk Song', 21, 'Puestos de socorro', 'Trail', '2024/08/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Flexidy', 'Cadete', 2137.12, 785.07, 1472.42, 'Xiaohekou', 34, 'Avituallamiento líquido', 'Trail', '2024/09/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Ronstring', 'Cadete', 3063.51, 440.74, 601.82, 'Begang', 80, 'Puestos de socorro', 'Trail', '2024/10/06');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Stim', 'Cadete', 515.19, 1164.25, 844.32, 'Perelhal', 8, 'Avituallamiento líquido', 'Maratón', '2024/08/07');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Alphazap', 'Veterana B', 2547.92, 682.14, 1334.18, 'Lingyuan', 8, 'TIempo final', 'Ultra', '2024/10/13');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tin', 'Promesa', 2157.03, 718.54, 1118.78, 'Helsingborg', 80, 'TIempo final', 'Vertical', '2024/09/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Flowdesk', 'Cadete', 3913.53, 868.78, 862.45, 'Nishor', 8, 'TIempo final', 'Ultra', '2024/12/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Solarbreeze', 'Sénior', 1033.82, 1232.77, 646.41, 'Bełsznica', 9, 'Zonas ecológicas', 'Vertical', '2024/05/29');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Y-find', 'Promesa', 3173.17, 1387.02, 952.88, 'Baishi', 12, 'Puestos de socorro', 'Trail', '2024/12/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bigtax', 'Cadete', 3623.36, 1271.25, 549.93, 'Lincheng', 8, 'Avituallamiento líquido', 'Maratón', '2024/12/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Y-find', 'Veterana B', 2426.77, 810.64, 144.24, 'Fuji', 12, 'Avituallamiento líquido', 'Media Maratón', '2024/07/18');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Veterana B', 2069.53, 269.7, 611.08, 'Vitoria-Gasteiz', 8, 'Parking', 'Vertical', '2024/01/08');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Keylex', 'Sénior', 1956.39, 521.94, 256.14, 'Krzeszów', 9, 'Puestos de socorro', 'Vertical', '2024/11/13');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Y-Solowarm', 'Cadete', 2955.99, 553.35, 859.0, 'Pembuanghulu', 21, 'TIempo final', 'Media Maratón', '2024/12/25');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tres-Zap', 'Promesa', 3616.15, 1225.86, 576.98, 'Chengdu', 8, 'Zonas ecológicas', 'Ultra', '2024/06/01');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tempsoft', 'Veterana B', 676.75, 360.67, 1167.11, 'Vol’nyy Aul', 80, 'TIempo final', 'Trail', '2024/07/30');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Regrant', 'Cadete', 3286.98, 472.71, 524.51, 'Macau', 9, 'Puestos de socorro', 'Maratón', '2024/07/23');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bamity', 'Sénior', 3735.51, 1101.03, 1124.07, 'Malishka', 9, 'Avituallamiento líquido', 'Trail', '2024/09/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Mat Lam Tam', 'Veterana A', 907.06, 254.35, 1329.23, 'Nanyaojie', 8, 'Avituallamiento sólido', 'Ultra', '2024/05/03');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Promesa', 1473.53, 790.11, 1364.11, 'Augusta', 80, 'TIempo final', 'Maratón', '2024/01/08');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Ronstring', 'Sénior', 1542.17, 927.02, 1326.81, 'Sŏnbong', 34, 'Tiempos intermedios', 'Ultra', '2024/08/12');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Biodex', 'Promesa', 850.71, 1449.56, 946.19, 'Caijiazha', 80, 'Parking', 'Ultra', '2024/10/03');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Subin', 'Veterana B', 866.07, 723.07, 486.83, 'Teutônia', 34, 'Parking', 'Media Maratón', '2024/05/27');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tresom', 'Veterana A', 1038.01, 1429.76, 1240.88, 'Mvomero', 80, 'Parking', 'Ultra', '2024/07/26');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Trippledex', 'Cadete', 3614.43, 275.31, 822.31, 'San Agustín de Valle Fértil', 8, 'Avituallamiento sólido', 'Media Maratón', '2024/09/02');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zamit', 'Sénior', 896.26, 436.65, 1339.82, 'Sydney', 9, 'Tiempos intermedios', 'Maratón', '2024/12/13');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Y-Solowarm', 'Sénior', 2524.64, 1362.82, 866.47, 'Mabamba', 8, 'Avituallamiento sólido', 'Maratón', '2024/11/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Overhold', 'Promesa', 712.83, 1139.95, 152.13, 'Horana South', 9, 'Zonas ecológicas', 'Ultra', '2024/06/04');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Fintone', 'Cadete', 3231.32, 729.92, 168.4, 'Bozhou', 12, 'Puestos de socorro', 'Trail', '2024/01/13');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Cookley', 'Cadete', 2527.06, 1358.87, 768.82, 'Nīkêh', 80, 'Puestos de socorro', 'Vertical', '2024/04/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bigtax', 'Junior', 3624.23, 317.07, 208.01, 'Yarumela', 80, 'Avituallamiento líquido', 'Trail', '2024/04/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Voltsillam', 'Veterana A', 3758.61, 146.68, 726.39, 'Jatimulyo', 8, 'Zonas ecológicas', 'Maratón', '2024/06/28');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Lotlux', 'Sénior', 1190.29, 1307.63, 147.02, 'Stetseva', 80, 'Parking', 'Vertical', '2024/07/02');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Stronghold', 'Cadete', 865.84, 1422.54, 762.83, 'Tiniguiban', 34, 'Zonas ecológicas', 'Ultra', '2024/04/09');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Cardguard', 'Veterana A', 2111.98, 329.07, 381.19, 'Mojkovac', 12, 'TIempo final', 'Trail', '2024/01/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tin', 'Cadete', 3139.48, 1425.86, 740.11, 'Honghualiangzi', 8, 'Avituallamiento sólido', 'Maratón', '2024/12/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Flexidy', 'Junior', 895.86, 1153.91, 1188.22, 'Gjinoc', 80, 'Avituallamiento líquido', 'Ultra', '2024/12/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Sub-Ex', 'Promesa', 1751.17, 1048.88, 916.42, 'Eindhoven', 12, 'Avituallamiento líquido', 'Trail', '2024/12/30');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bitchip', 'Veterana A', 1383.52, 1178.67, 516.66, 'Kadaka', 34, 'Avituallamiento sólido', 'Ultra', '2024/09/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Voltsillam', 'Veterana B', 3786.52, 268.11, 1498.67, 'Lawesigalagala Timur', 12, 'Parking', 'Maratón', '2024/11/13');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Sénior', 1471.79, 1340.97, 1178.43, 'Qiaotou', 8, 'Zonas ecológicas', 'Media Maratón', '2024/01/13');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Lotlux', 'Cadete', 3366.58, 1416.96, 251.71, 'Baraya', 9, 'TIempo final', 'Media Maratón', '2024/11/02');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Holdlamis', 'Sénior', 851.67, 526.89, 1137.71, 'Kveda Chkhorots’q’u', 80, 'Parking', 'Media Maratón', '2024/01/29');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Junior', 3543.15, 402.6, 1206.78, 'Áno Merá', 80, 'Zonas ecológicas', 'Trail', '2024/08/07');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Andalax', 'Promesa', 825.5, 674.95, 1189.65, 'Kanália', 80, 'Avituallamiento líquido', 'Trail', '2024/04/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Lotlux', 'Veterana B', 3945.7, 782.44, 476.93, 'Kalapadua', 12, 'Puestos de socorro', 'Vertical', '2024/04/25');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Vagram', 'Junior', 3614.23, 1332.57, 1233.27, 'Gakem', 8, 'TIempo final', 'Maratón', '2024/10/06');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Quo Lux', 'Veterana B', 3628.54, 780.4, 1128.8, 'Itajuípe', 34, 'Avituallamiento líquido', 'Trail', '2024/04/19');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Konklux', 'Sénior', 3432.43, 1042.27, 1278.56, 'Staryy Cherek', 9, 'Tiempos intermedios', 'Media Maratón', '2024/10/03');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bitchip', 'Promesa', 765.31, 759.78, 670.45, 'Desa Gegempalan', 80, 'Tiempos intermedios', 'Maratón', '2024/11/23');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Junior', 2274.56, 965.19, 713.34, 'Lefortovo', 9, 'Avituallamiento líquido', 'Trail', '2024/10/08');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Solarbreeze', 'Cadete', 1166.89, 1288.11, 663.8, 'Thomastown', 12, 'Tiempos intermedios', 'Maratón', '2024/02/07');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Voltsillam', 'Veterana A', 2458.93, 768.66, 243.39, 'Yonghe', 34, 'TIempo final', 'Media Maratón', '2024/12/25');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zathin', 'Sénior', 1544.62, 1334.13, 687.49, 'Hrastnik', 8, 'TIempo final', 'Maratón', '2024/08/04');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zontrax', 'Sénior', 2593.07, 1114.75, 544.34, 'Växjö', 80, 'Tiempos intermedios', 'Maratón', '2024/09/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Otcom', 'Veterana A', 3991.01, 871.61, 255.34, 'Lukou', 9, 'Parking', 'Media Maratón', '2024/08/18');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Zoolab', 'Cadete', 3953.14, 1285.25, 706.49, 'Kembangkerang Satu', 80, 'Tiempos intermedios', 'Vertical', '2024/05/14');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bamity', 'Promesa', 1533.15, 899.66, 1148.38, 'Pico da Pedra', 34, 'Parking', 'Maratón', '2024/04/25');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Mat Lam Tam', 'Promesa', 1588.37, 621.33, 353.82, 'Ballsh', 8, 'Avituallamiento líquido', 'Ultra', '2024/03/03');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Y-Solowarm', 'Cadete', 1423.46, 1322.69, 998.02, 'Lengji', 80, 'Avituallamiento líquido', 'Maratón', '2024/08/16');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Domainer', 'Cadete', 1488.61, 1157.75, 301.95, 'Limeil-Brévannes', 8, 'Parking', 'Trail', '2024/01/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Asoka', 'Sénior', 3508.6, 961.02, 1328.03, 'Senta', 9, 'Parking', 'Maratón', '2024/09/05');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Pannier', 'Promesa', 3003.61, 739.11, 159.27, 'Guangshan Chengguanzhen', 21, 'Tiempos intermedios', 'Trail', '2024/08/18');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Stim', 'Sénior', 3830.6, 692.94, 1308.02, 'Sinarwangi', 34, 'Tiempos intermedios', 'Vertical', '2024/12/20');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Duobam', 'Junior', 1527.58, 935.74, 1403.01, 'Ragana', 21, 'Parking', 'Media Maratón', '2024/05/17');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Ventosanzap', 'Veterana A', 819.85, 1057.83, 1422.19, 'Lajedo', 12, 'Puestos de socorro', 'Trail', '2024/10/16');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('It', 'Junior', 2416.1, 745.38, 1238.0, 'Shabo', 12, 'TIempo final', 'Trail', '2024/07/12');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Fix San', 'Junior', 3710.25, 1385.35, 591.25, 'Stronie', 80, 'TIempo final', 'Maratón', '2024/07/25');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Gembucket', 'Cadete', 2088.69, 931.36, 467.79, 'Dalianhe', 34, 'TIempo final', 'Media Maratón', '2024/04/24');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Rank', 'Veterana B', 734.12, 493.41, 831.71, 'Tekeli', 9, 'Zonas ecológicas', 'Trail', '2024/05/14');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Tempsoft', 'Junior', 1440.59, 874.23, 245.23, 'Ed', 21, 'Zonas ecológicas', 'Trail', '2024/03/08');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Bigtax', 'Veterana A', 2592.23, 1089.44, 1052.49, 'Kristinehamn', 8, 'Avituallamiento sólido', 'Media Maratón', '2024/08/22');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('It', 'Veterana A', 693.12, 106.74, 556.12, 'Marechal Deodoro', 12, 'Zonas ecológicas', 'Ultra', '2024/04/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Latlux', 'Veterana B', 1238.27, 619.97, 1309.79, 'Cilolohan', 12, 'Puestos de socorro', 'Ultra', '2024/09/28');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Flowdesk', 'Sénior', 3959.84, 810.29, 464.82, 'Meicheng', 34, 'Parking', 'Trail', '2024/08/21');
insert into races (name, categories, total_slope, positive_slope, negative_slope, poblation, distance, services, modality, race_day) values ('Temp', 'Junior', 3709.1, 295.41, 839.64, 'Nîmes', 21, 'Zonas ecológicas', 'Vertical', '2024/10/21');



insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (1, 'Lee Cartlidge', 'lcartlidge0', 'lcartlidge0@yellowpages.com', 'kJ2_1+#XPZ', 'Xiji', '276-589-7765', 'Maggio-Wyman', '82.133.212.57', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (2, 'Emma Phlippsen', 'ephlippsen1', 'ephlippsen1@naver.com', 'nT1~W*!"+YZk4A', 'Shicheng', '243-685-7694', 'Brown and Sons', '196.125.142.81', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (3, 'Dot Prodrick', 'dprodrick2', 'dprodrick2@kickstarter.com', 'gG1.<li7W~qdlYE!', 'Wierzchosławice', '265-751-6999', 'Botsford-Kuhic', '161.131.204.97', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (4, 'Heida Grinikhin', 'hgrinikhin3', 'hgrinikhin3@epa.gov', 'lV5"JuwQ~d', 'Tuanjie', '523-258-4690', 'Marks, Doyle and Bergstrom', '176.81.75.73', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (5, 'Twyla Rawkesby', 'trawkesby4', 'trawkesby4@economist.com', 'yP1#3wPuR', 'Sudogda', '315-568-9067', 'Wintheiser Group', '255.192.160.147', 'User');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (6, 'Anneliese Tasseler', 'atasseler5', 'atasseler5@ucsd.edu', 'tM4)svD8c5"{@Gh', 'Shawnee Mission', '913-775-6453', 'Simonis, Breitenberg and Hyatt', '11.190.172.131', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (7, 'Daphne Nanninini', 'dnanninini6', 'dnanninini6@chicagotribune.com', 'pI0!ygO{#P@Dd=F3', 'Torreira', '888-179-8742', 'McDermott-Crona', '116.227.158.220', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (8, 'Ezekiel Lodo', 'elodo7', 'elodo7@usda.gov', 'wI6)''dV7Z|OF6', 'Xuxiake', '962-842-2290', 'Dietrich-Hegmann', '8.61.187.205', 'User');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (9, 'Mariana Shovlar', 'mshovlar8', 'mshovlar8@google.fr', 'wM1!l#/r0p(4Ah', 'Sinarbakti', '583-413-2907', 'Herzog-Rempel', '146.69.15.93', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (10, 'Dotti Ceaser', 'dceaser9', 'dceaser9@ucsd.edu', 'gP8.6>$o*rv', 'Kalýves Polygýrou', '438-105-7374', 'Marks, Doyle and Kertzmann', '31.62.174.210', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (11, 'Anne Dunton', 'aduntona', 'aduntona@printfriendly.com', 'fB5/k7xZ', 'Martingança', '487-812-8330', 'Blick-Lubowitz', '254.206.83.226', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (12, 'Tirrell Lates', 'tlatesb', 'tlatesb@shareasale.com', 'qV4<`)QB', 'Wetzlar', '652-617-0136', 'Abbott, Yost and Kiehn', '225.69.101.170', 'User');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (13, 'Spence Terzza', 'sterzzac', 'sterzzac@gravatar.com', 'mS0#L~kcy~I', 'Sembungan Kidul', '220-935-4616', 'Collier Group', '7.137.237.128', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (14, 'Felicia Evequot', 'fevequotd', 'fevequotd@scientificamerican.com', 'bK2\Taet', 'Sibanicú', '709-267-0143', 'Abbott and Sons', '204.156.134.238', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (15, 'Wes Labarre', 'wlabarree', 'wlabarree@google.nl', 'vS9+Je,,?R', 'Taibai', '197-222-3042', 'Ruecker, Effertz and Kub', '210.87.42.120', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (16, 'Marlo Prati', 'mpratif', 'mpratif@cam.ac.uk', 'zG1>7`r<q19/''RT', 'Rokiškis', '292-329-7755', 'Wunsch-Connelly', '79.109.179.191', 'Anonimous');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (17, 'Kaylee Greenham', 'kgreenhamg', 'kgreenhamg@etsy.com', 'gS3"(T@kr!', 'Rungis', '427-974-5800', 'Grimes Inc', '151.156.133.246', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (18, 'Frants Themann', 'fthemannh', 'fthemannh@wsj.com', 'oE9.X+wZ', 'San Francisco', '946-764-5706', 'Dicki, Lesch and Macejkovic', '192.71.177.44', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (19, 'Silvia Tolussi', 'stolussii', 'stolussii@vk.com', 'lY8|W"0_gLO)W', 'Dragash', '624-522-5261', 'Streich-Grimes', '228.227.209.198', 'Organizer');
insert into users (id, name, username, mail, pass, city, phone, club, photo, rol) values (20, 'Ugo Mundford', 'umundfordj', 'umundfordj@bing.com', 'xX7*qq|r', 'Mao', '651-589-2016', 'Homenick and Sons', '232.164.235.6', 'User');
