drop database if exists gluehhaus;
create database if not exists gluehhaus;
use gluehhaus;

create table if not exists Wein(
	Wein_Id integer unsigned not null auto_increment, 
	Name varchar(50),
	Prozente decimal(4,2),
	primary key (Wein_Id)
);

create table if not exists Zutat(
	Zutat_Id integer unsigned not null auto_increment,
	Name varchar(50),
	Ranking integer unsigned, 
	primary key (Zutat_Id)
);

create table if not exists Gluehwein(
	Wein_Id integer unsigned not null,
	Zutat_Id integer unsigned not null,
	Name varchar(50),
	Basispreis decimal(3,2) not null,
	primary key (Wein_Id,Zutat_Id),
	foreign key (Wein_Id) references Wein(Wein_Id)
		ON DELETE NO ACTION
		ON UPDATE cascade,
	foreign key (Zutat_Id) references Zutat(Zutat_Id)
		ON DELETE NO ACTION
		ON UPDATE cascade
);

create table if not exists Kassierer(
	Kassierer_Id integer unsigned not null auto_increment,
	Nachname varchar(50),
	Vorname varchar(50),
	Provision decimal(1,0), 
	primary key (Kassierer_Id)
);

create table if not exists Bestellung(
	Bestellung_Id integer unsigned not null auto_increment, 
	Bestellzeit timestamp,
	Kassierer_Id integer unsigned not null,
	# Summe? 
	primary key (Bestellung_Id),
	foreign key (Kassierer_Id) references Kassierer(Kassierer_Id)
		ON DELETE NO action
		ON UPDATE cascade
);

/** Hier könnten wir noch einen Status einbauen, 
  *	damit die Theke auch abhaken kann, was ausgegeben wurde 
  ***/
create table if not exists Bestellposition(
	Bestellung_Id integer unsigned not null,
	Wein_Id integer unsigned not null,
	Zutat_Id integer unsigned not null,
	Anzahl integer unsigned not null,
	primary key (Bestellung_Id, Wein_Id, Zutat_Id),
	foreign key (Bestellung_Id) references Bestellung(Bestellung_Id)
		on delete no action
		on update cascade,
	foreign key (Wein_Id, Zutat_Id) references Gluehwein(Wein_Id, Zutat_Id)
		on delete no action
		on update cascade
);



/*** Demo-Daten **/
insert into Wein values (1, 'Lemberger', 13.0);
insert into Wein values (2, 'Trollinger', 12.0);
insert into Wein values (3, 'Chardonnay', 12.5);

insert into Zutat values (1, 'Eierlikör', 3);
insert into Zutat values (2, 'Nelke', 4);
insert into Zutat values (3, 'Zimt', 5);
insert into Zutat values (4, 'Brandy', 4);
insert into Zutat values (5, 'Rum', 4);
insert into Zutat values (6, 'Orange', 4);


insert into Gluehwein values (1,6,'Orangenweihnacht', 3.0);
insert into Gluehwein values (2,5,'Santas Darling', 3.5);
insert into Gluehwein values (3,1,'Weiße Weihnacht', 4);
insert into Gluehwein values (3,4,"Rudolphs Rachenputzer",4);
insert into Gluehwein values (3,5,"Kristmas Kracher",4);

insert into Kassierer values (1, 'Janiesch', 'Christian', 6);
insert into Kassierer values (2, 'Bühler', 'Robin', 5);
insert into Kassierer values (3, 'Imgrund', 'Florian', 3);

INSERT INTO gluehhaus.Bestellung VALUES (1,'2014-12-12 15:45:37',2);
INSERT INTO gluehhaus.Bestellung VALUES (2,'2014-12-12 16:45:37',2);
INSERT INTO gluehhaus.Bestellung VALUES (3,'2014-12-13 10:36:55',3);
INSERT INTO gluehhaus.Bestellung VALUES (4,'2014-12-13 10:45:04',1);
INSERT INTO gluehhaus.Bestellung VALUES (5,'2014-12-15 10:18:31',1);
INSERT INTO gluehhaus.Bestellung VALUES (6,'2014-12-13 18:36:55',3);
INSERT INTO gluehhaus.Bestellung VALUES (7,'2014-12-13 18:39:04',1);
INSERT INTO gluehhaus.Bestellung VALUES (8,'2014-12-13 18:40:13',1);
INSERT INTO gluehhaus.Bestellung VALUES (9,'2014-12-13 18:42:22',1);
INSERT INTO gluehhaus.Bestellung VALUES (10,'2014-12-13 18:59:31',2);
INSERT INTO gluehhaus.Bestellung VALUES (11,'2014-12-13 19:17:40',3);
INSERT INTO gluehhaus.Bestellung VALUES (12,'2014-12-13 20:39:49',1);
INSERT INTO gluehhaus.Bestellung VALUES (13,'2014-12-13 19:23:58',1);
INSERT INTO gluehhaus.Bestellung VALUES (14,'2014-12-13 19:24:07',3);
INSERT INTO gluehhaus.Bestellung VALUES (15,'2014-12-13 19:24:16',1);
INSERT INTO gluehhaus.Bestellung VALUES (16,'2014-12-13 19:24:25',1);
INSERT INTO gluehhaus.Bestellung VALUES (17,'2014-12-13 19:24:34',2);
INSERT INTO gluehhaus.Bestellung VALUES (18,'2014-12-13 19:24:43',3);
INSERT INTO gluehhaus.Bestellung VALUES (19,'2014-12-13 19:24:52',3);
INSERT INTO gluehhaus.Bestellung VALUES (20,'2014-12-13 19:25:01',3);
INSERT INTO gluehhaus.Bestellung VALUES (21,'2014-12-14 17:45:37',3);
INSERT INTO gluehhaus.Bestellung VALUES (22,'2014-12-14 17:47:51',2);
INSERT INTO gluehhaus.Bestellung VALUES (23,'2014-12-14 17:50:05',1);
INSERT INTO gluehhaus.Bestellung VALUES (24,'2014-12-14 17:52:19',2);
INSERT INTO gluehhaus.Bestellung VALUES (25,'2014-12-14 17:54:33',1);
INSERT INTO gluehhaus.Bestellung VALUES (26,'2014-12-14 17:56:47',1);
INSERT INTO gluehhaus.Bestellung VALUES (27,'2014-12-14 17:59:01',2);
INSERT INTO gluehhaus.Bestellung VALUES (28,'2014-12-14 18:01:15',2);
INSERT INTO gluehhaus.Bestellung VALUES (29,'2014-12-14 18:03:29',3);
INSERT INTO gluehhaus.Bestellung VALUES (30,'2014-12-14 18:05:43',1);
INSERT INTO gluehhaus.Bestellung VALUES (31,'2014-12-14 18:07:57',1);
INSERT INTO gluehhaus.Bestellung VALUES (32,'2014-12-14 18:10:11',2);
INSERT INTO gluehhaus.Bestellung VALUES (33,'2014-12-14 18:12:25',3);
INSERT INTO gluehhaus.Bestellung VALUES (34,'2014-12-14 18:14:39',3);
INSERT INTO gluehhaus.Bestellung VALUES (35,'2014-12-14 18:16:53',1);
INSERT INTO gluehhaus.Bestellung VALUES (36,'2014-12-14 18:19:07',2);

INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (1, 1, 6, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (1, 2, 5, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (2, 3, 1, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (2, 2, 5, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (3, 3, 1, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (4, 1, 6, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (5, 2, 5, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (6, 3, 1, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (7, 1, 6, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (8, 2, 5, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (9, 1, 6, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (10, 1, 6, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (10, 3, 4, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (11, 2, 5, 5);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (11, 3, 5, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (11, 1, 6, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (12, 2, 5, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (12, 3, 4, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (13, 3, 1, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (14, 2, 5, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (15, 3, 1, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (16, 2, 5, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (16, 1, 6, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (17, 1, 6, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (18, 3, 5, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (19, 3, 4, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (20, 1, 6, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (20, 2, 5, 5);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (21, 1, 6, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (22, 2, 5, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (22, 2, 5, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (23, 3, 4, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (24, 1, 6, 5);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (25, 2, 5, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (26, 1, 6, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (26, 1, 6, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (26, 3, 5, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (27, 2, 5, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (28, 2, 5, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (28, 3, 4, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (29, 1, 6, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (29, 3, 5, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (30, 1, 6, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (31, 3, 1, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (32, 1, 6, 5);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (33, 2, 5, 3);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (33, 3, 4, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (34, 3, 4, 4);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (34, 1, 6, 2);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (35, 3, 5, 1);
INSERT INTO gluehhaus.Bestellposition (Bestellung_Id, Wein_Id, Zutat_Id, Anzahl) VALUES (36, 3, 4, 5);

/** Print Data **/
select * from Wein;
select * from Zutat;
select * from Kassierer;
select * from Bestellung;
select * from Gluehwein;
select * from Bestellposition;