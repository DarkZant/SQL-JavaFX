--Étienne Mitchell-Bouchard (20243430)
--Martin Medina (20235219)
--Vincent Clouâtre (20248263)
--Melzi Ibrahim (20066033)

--Créer les tables

begin transaction;

create domain ArbitreRoleType as varchar(255) 
  check (value LIKE 'Assistant' or value LIKE 'Principal');
  
create domain CouleurCartonType as varchar(255) 
  check (value LIKE 'Rouge' or value LIKE 'Jaune');

create domain PositionType as varchar(255)
  check (value LIKE 'Attaquant' or value LIKE 'Defenseur' or value LIKE 'Gardien' or value LIKE 'Milieu');

create domain RangType as int
  check (value >= 0 and value <= 4);

create domain NumeroType as int
  check (value >= 1 and value <= 99);

create domain ScoreType as int
 check (value >= 0);
  
create table Equipe (
  EquipeID int primary key,
  Pays varchar(255) not null,
  Annee int not null
);

create table Stade (
  NomDuStade varchar(255) primary key,
  Pays varchar(255) not null,
  Ville varchar(255) not null
);


create table Match (
  MatchID int primary key,
  Stade varchar(255) not null references Stade(NomDuStade),
  Date date not null,
  ScoreEquipe1 ScoreType default 0,
  ScoreEquipe2 ScoreType default 0,
  Rang RangType not null
);

create table Arbitre (
  ArbitreID int primary key,
  Nom varchar(255) not null,
  Role ArbitreRoleType not null
);

create table Joueur (
  JoueurID int primary key,
  Nom varchar(255) not null,
  Numero NumeroType not null,
  Position PositionType,
  EquipeID int not null references Equipe(EquipeID)
);

create table MembreStaffTechnique (
  MembreStaffID int primary key,
  Role varchar(255) not null,
  Nom varchar(255) not null,
  EquipeID int not null references Equipe(EquipeID)
);

create table Participe (
  ParticipeID int primary key,
  EquipeID int not null references Equipe(EquipeID),
  MatchID int not null references Match(MatchID)
);

create table Gere (
  GereID int primary key,
  ArbitreID int not null references Arbitre(ArbitreID),
  MatchID int not null references Match(MatchID)
);

create table But (
  ButID int primary key,	
  JoueurID int not null references Joueur(JoueurID),
  PasseID int references Joueur(JoueurID),
  MatchID int not null references Match(MatchID),
  MarqueurID int references Joueur (JoueurID)
);

create table Sanction (
  SanctionID int primary key,
  JoueurID int not null references Joueur(JoueurID),
  MatchID int not null references Match(MatchID),
  CouleurCarton CouleurCartonType not null
);
create table  NumeroJoueur (
  NumeroJoueurID int primary key,
  Nom varchar(255),
  Numero int,
  EquipeID int not null references Equipe(EquipeID)
);
create table Marqueur (
    MarqueurID int primary key,
    NomJoueurBut varchar(255),
    foreign key (MarqueurID) references Joueur(JoueurID)
);
create table Passeur (
    PasseID int primary key,
    NomJoueurPasse varchar(255),
    foreign key (PasseID) references Joueur(JoueurID)
);
commit;

-- Remplir les tables

begin transaction;
insert into Equipe (EquipeID,Pays,Annee)
values (1,'Canada',2024),
(2,'USA',2024),
(3,'Mexique',2024),
(4,'France',2024),
(5,'Allemagne',2024),
(6,'Russie',2024),
(7,'Chine',2024),
(8,'Inde',2024),
(9,'Australie',2024),
(10,'Suisse',2024),
(11,'Italie',2024),
(12,'Algerie',2024),
(13,'Afrique du Sud',2024),
(14,'Maroc',2024),
(15,'Espagne',2024),
(16,'Portugal',2024);

insert into Joueur(JoueurID,Nom,Numero,Position,EquipeID)
values (1,'JoueurC1',1,'Milieu',1),
(2,'JoueurD1',2,'Defenseur',1),
(3,'JoueurG1',3,'Gardien',1),
--
(4,'JoueurC2',1,'Milieu',2),
(5,'JoueurD2',2,'Defenseur',2),
(6,'JoueurG2',3,'Gardien',2),
--
(7,'JoueurC3',1,'Milieu',3),
(8,'JoueurD3',2,'Defenseur',3),
(9,'JoueurG3',3,'Gardien',3),
--
(10,'JoueurC4',1,'Milieu',4),
(11,'JoueurD4',2,'Defenseur',4),
(12,'JoueurG4',3,'Gardien',4),
--
(13,'JoueurC5',1,'Milieu',5),
(14,'JoueurD5',2,'Defenseur',5),
(15,'JoueurG5',3,'Gardien',5),
--
(16,'JoueurC6',1,'Milieu',6),
(17,'JoueurD6',2,'Defenseur',6),
(18,'JoueurG6',3,'Gardien',6),
--
(19,'JoueurC7',1,'Milieu',7),
(20,'JoueurD7',2,'Defenseur',7),
(21,'JoueurG7',3,'Gardien',7),
--
(22,'JoueurC8',1,'Attaquant',8),
(23,'JoueurD8',2,'Defenseur',8),
(24,'JoueurG8',3,'Gardien',8),
--
(25,'JoueurC9',1,'Milieu',9),
(26,'JoueurD9',2,'Attaquant',9),
(27,'JoueurG9',3,'Gardien',9),
--
(28,'JoueurC10',1,'Milieu',10),
(29,'JoueurD10',2,'Defenseur',10),
(30,'JoueurG10',3,'Attaquant',10);

Insert into MembreStafftechnique (MembreStaffID,Role,Nom,EquipeID)
values (1,'Coach', 'MST1',1),
(2,'Technicien','MST2',1),
(3,'Coach','MST3',2),
(4,'Technicien','MST4',2),
(5,'Coach','MST5',3),
(6,'Technicien','MST6',3),
(7,'Coach','MST7',4),
(8,'Technicien','MST8',4),
(9,'Coach','MST9',5),
(10,'Technicien','MST10',5),
(11,'Coach','MST11',6),
(12,'Technicien','MST12',6),
(13,'Coach','MST13',7),
(14,'Technicien','MST14',7),
(15,'Coach','MST15',8),
(16,'Technicien','MST16',8),
(17,'Coach','MST17',9),
(18,'Technicien','MST18',9),
(19,'Coach','MST19',10),
(20,'Technicien','MST20',10);

insert into Stade (NomDuStade,Pays,Ville)
values ('StadeCanada','Canada','VilleCanada'),
('StadeUSA','USA','VilleUSA'),
('StadeMexique','Mexique','VilleMexique'),
('StadeFrance','France','VilleFrance'),
('StadeAllemagne','Allemagne','VilleAllemagne'),
('StadeRussie','Russie','VilleRussie'),
('StadeChine','Chine','VilleChine'),
('StadeInde','Inde','VilleInde'),
('StadeAustralie','Australie','VilleAustralie'),
('Stade de Toronto','Canada','Toronto'),
('Stade de Guadalajara','Mexique','Zapopan Jalisco'),
('Stade Atlanta','Etats-Unis','Atlanta'),
('StadeSuisse','Suisse','VilleSuisse');

insert into Arbitre (ArbitreID,Nom,Role)
values (1,'Jeff','Assistant'),
(2,'Marc','Assistant'),
(3,'Alex','Assistant'),
(4,'Tony','Assistant'),
(5,'Mario','Assistant'),
(6,'Luigi','Assistant'),
(7,'Waluigi','Principal'),
(8,'Toad','Principal'),
(9,'Wario','Principal'),
(10,'Bowser','Principal'),
(11,'Wilton Pereira Sampaio','Principal');

insert into Match (MatchID, Date, ScoreEquipe1, ScoreEquipe2, Rang, Stade)
values (1,'2024-12-27',0,1,0,'StadeCanada'),
(2,'2024-12-13',0,1,0,'StadeCanada'),
(3,'2024-12-01',0,3,0,'StadeUSA'),
(4,'2024-10-28',2,1,0,'StadeMexique'),
(5,'2024-10-15',0,1,0,'StadeChine'),
(6,'2024-09-27',2,3,0,'StadeRussie'),
(7,'2024-09-15',2,1,1,'StadeSuisse'),
(8,'2024-08-25',1,0,1,'StadeFrance'),
(9,'2024-08-06',3,1,1,'StadeInde'),
(10,'2024-07-29',0,1,1,'StadeChine'),
(11,'2024-07-17',2,1,1,'StadeSuisse'),
(12,'2024-07-15',1,0,1,'StadeSuisse'),
(13,'2024-06-27',1,3,1,'StadeRussie'),
(14,'2024-06-07',1,0,1,'StadeCanada'),
(15,'2024-05-28',0,1,2,'StadeCanada'),
(16,'2024-05-11',2,1,2,'StadeCanada'),
(17,'2024-05-10',0,2,2,'StadeUSA'),
(18,'2024-04-22',0,3,3,'StadeMexique'),
(19,'2024-04-14',3,1,3,'StadeAustralie'),
(20,'2024-04-01',2,1,4,'StadeAustralie');
insert into Participe (ParticipeID, EquipeID,MatchID)
values (1,1,1),
(2,2,1),
(3,1,2),
(4,3,2),
(5,1,3),
(6,4,3),
(7,2,4),
(8,3,4),
(9,2,5),
(10,4,5),
(11,3,6),
(12,4,6),
(13,4,7),
(14,5,7),
(15,4,8),
(16,6,8),
(17,1,9),
(18,5,9),
(19,1,10),
(20,6,10),
(21,2,11),
(22,5,11),
(23,2,12),
(24,6,12),
(25,3,13),
(26,5,13),
(27,3,14),
(28,6,14),
(29,1,15),
(30,7,15),
(31,2,16),
(32,7,16),
(33,3,17),
(34,7,17),
(35,4,18),
(36,7,18),
(37,1,19),
(38,8,19),
(39,2,20),
(40,8,20);

insert into But (ButID,JoueurID,PasseID,MatchID)
values 
--1 2 1
-- 0
-- 1
(1,4,NULL,1),
--1 3 2

--0

--1

(2,7,8,2),
--1 4 3

--0

--3

(3,10,11,3),
(4,10,NULL,3),
(5,11,NULL,3),
--2 3 4

--2

(6,4,5,4),
(7,5,4,4),
--1

(8,7,NULL,4),
--2 4 5

--0

--1

(9,10,NULL,4),
--3 4 6

--2

(10,7,8,6),
(11,7,8,6),
--3

(12,10,NULL,6),
(13,11,NULL,6),
(14,11,10,6),
--4 5 7

--2

(15,10,NULL,7),
(16,10,NULL,7),
--1

(17,13,14,7),
--4 6 8

--1

(18,10,NULL,8),
--0

--1 5 9

--3

(19,1,2,9),
(20,1,2,9),
(21,1,2,9),
--1

(22,14,NULL,9),
--1 6 10

--0

--1

(23,16,17,10),
--2 5 11

--2

(24,5,4,11),
(25,5,NULL,11),
--1

(26,14,NULL,11),
--2 6 12

--1

(27,4,5,12),
--0

--3 5 13

--1

(28,7,NULL,13),
--3

(29,13,14,13),
(30,13,14,13),
(31,13,NULL,13),
--3 6 14

--1

(32,8,NULL,14),
--0

--1 7 15

--0

--1

(33,19,20,15),
--2 7 16

--2

(34,4,5,16),
(35,4,5,16),
--1

(36,19,NULL,16),
--3 7 17

--0

--2

(37,19,20,17),
(38,20,NULL,17),
--4 7 18

--0

--3

(39,20,19,18),
(40,20,NULL,18),
(41,19,NULL,18),
--1 8 19

--3

(42,1,2,19),
(43,1,NULL,19),
(44,2,NULL,19),
--1

(45,22,NULL,19),
--2 8 20

--2

(46,4,NULL,20),
(47,4,NULL,20),
--1

(48,22,NULL,20);

insert into Sanction (SanctionID, JoueurID,MatchID,CouleurCarton) 
values
(1,10,1,'Jaune'),
(2,4,4,'Jaune'),
(3,4,4,'Jaune'),
(4,7,4,'Jaune'),
(5,7,4,'Jaune'),
(6,7,4,'Rouge'),
(7,1,9,'Jaune'),
(8,1,9,'Jaune'),
(9,5,11,'Jaune'),
(10,5,11,'Jaune'),
(11,28,14,'Rouge');

insert into Gere (GereID,ArbitreID,MatchID)
values
(1,7,1),
(2,1,1),
(3,2,1),
(4,3,1),

(5,8,2),
(6,4,2),
(7,5,2),
(8,6,2),

(9,9,3),
(10,1,3),
(11,2,3),
(12,3,3),

(13,10,4),
(14,4,4),
(15,5,4),
(16,6,4),

(17,7,5),
(18,1,5),
(19,2,5),
(20,3,5),

(21,8,6),
(22,4,6),
(23,5,6),
(24,6,6),

(25,9,7),
(26,1,7),
(27,2,7),
(28,3,7),

(29,10,8),
(30,4,8),
(31,5,8),
(32,6,8),

(33,7,9),
(34,1,9),
(35,2,9),
(36,3,9),

(37,8,10),
(38,4,10),
(39,5,10),
(40,6,10),

(41,9,11),
(42,1,11),
(43,2,11),
(44,3,11),

(45,10,12),
(46,4,12),
(47,5,12),
(48,6,12),

(49,7,13),
(50,1,13),
(51,2,13),
(52,3,13),

(53,8,14),
(54,4,14),
(55,5,14),
(56,6,14),

(57,9,15),
(58,1,15),
(59,2,15),
(60,3,15),

(61,10,16),
(62,4,16),
(63,5,16),
(64,6,16),

(65,7,17),
(66,1,17),
(67,2,17),
(68,3,17),

(69,8,18),
(70,4,18),
(71,5,18),
(72,6,18),

(73,9,19),
(74,1,19),
(75,2,19),
(76,3,19),

(77,10,20),
(78,4,20),
(79,5,20),
(80,6,20);
INSERT INTO NumeroJoueur
    (NumeroJoueurID, Nom, EquipeID, Numero)
VALUES
    (1,'JoueurC2', 1, 2),
    (2,'JoueurD2',2, 2),
    (3,'JoeurG10',10,3),
    (4,'JoueurD3',3, 2),
    (5,'JoueurC4',4, 1),
    (6,'JoueurG4',4, 3),
    (7,'JoueurG6',6, 3),
    (8,'JoueurC7',7, 1),
    (9,'JoueurG7',7, 3),
    (10,'JoueurD9',9, 2),
    (11,'JoueurC8', 8, 1);
   



INSERT INTO Marqueur
    (MarqueurID, NomJoueurBut)
VALUES
    (1, 'JoueurG10'),
    (2, 'JoueurC6'),
    (3, 'JoueurC2'),
    (4, 'JoueurD9'),
    (5, 'JoueurD2'),
    (6, 'JoueurC4'),
    (7, 'JoueurC5'),
    (8, 'JoueurD8'),
    (9, 'JoueurC9'),
    (10, 'JoueurC3'),
    (11, 'JoueurG10');
    

-- Insertion dans la table Passeur
INSERT INTO Passeur
    (PasseID, NomJoueurPasse)
VALUES
    (1, 'JoueurC5'),
    (2, 'JoueurC4'),
    (3, 'JoueurC7'),
    (4, 'JoueurC9'),
    (5, 'JoueurD2'),
    (6, 'JoueurC3'),
    (8, 'JoueurC2'),
    (9, 'JoueurD8'),
    (10,'JoueurD2'),
    (11, 'JoueurG10');



commit;

-- Requêtes

-- Requête 1
-- Classe les arbitres par le nombre de cartons donnés
-- Donne toute les informations de l'arbitre ainsi que son nombre total de carton donnés
select ar.*, Count(sa.SanctionID) as total_carton
From arbitre ar
left join gere ge on ar.ArbitreID=ge.ArbitreID
Left join match ma on ge.MatchID=ma.MatchID
Left join sanction sa on ma.MatchId = sa.MatchID
group by ar.ArbitreID
order by total_carton DESC;

-- Requête 2
-- Montre les 3 meilleur joueur qui ont marqué des buts avec leur information et l'information de leur équipe
-- Donne le nom, le numéro et la position du joueur ainsi que le pays et l'année de l'équipe de son équipe et le nombre total de but marqué
select jo.Nom, Jo.Numero, Jo.Position, eq.Pays, eq.annee, count(bu.ButID) as total_but
from joueur jo
left join Equipe eq on jo.EquipeID = eq.EquipeID
left join But bu on jo.JoueurID=bu.JoueurID
group by jo.JoueurID, eq.EquipeID
order by total_but DESC
LIMIT 3;

-- Requête 3
-- Montre les équipes en ordre alphabétique de pays avec leur nombre de but et de passe
-- Donne les infos de l'équipe ainsi que le nombre total de but et le nombre total de passe
select eq.*, count (bu.JoueurID) as total_but, count(bu.PasseID) as total_passe
from Equipe eq
left join Joueur jo on eq.EquipeID = jo.EquipeID
Left join But bu on jo.JoueurID = bu.JoueurID
group by eq.EquipeID
order by eq.pays;

-- Requête 4
-- Affiche les informations techniques de chaque match
-- Donne la date, le scoreÉquipe1, le scoreÉquipe2, le rank, le nom (nom arbitre), le nom du stade, le pays et la ville
select ma.date,ma.scoreEquipe1,ma.scoreEquipe2,ma.rang,ar.nom,st.nomdustade, st.pays, st.ville
from Match ma
inner join Gere ge on ma.MatchID = ge.MatchId
inner join Arbitre ar on ge.ArbitreID = ar.ArbitreID and ar.role = 'Principal'
inner join Stade st on ma.Stade = st.NomDuStade;