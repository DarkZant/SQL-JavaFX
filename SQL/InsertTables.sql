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
(13,'sud afrique',2024),
(14, 'Maroc',2024),
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

Insert into MembreStafftechnique (MembreStaffID,Role,EquipeID)
values (1,'Coach',1),
(2,'technicien',1),
(3,'Coach',2),
(4,'technicien',2),
(5,'Coach',3),
(6,'technicien',3),
(7,'Coach',4),
(8,'technicien',4),
(9,'Coach',5),
(10,'technicien',5),
(11,'Coach',6),
(12,'technicien',6),
(13,'Coach',7),
(14,'technicien',7),
(15,'Coach',8),
(16,'technicien',8),
(17,'Coach',9),
(18,'technicien',9),
(19,'Coach',10),
(20,'technicien',10);

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
values (1,'Jeff','assistant'),
(2,'Marc','assistant'),
(3,'Alex','assistant'),
(4,'Tony','assistant'),
(5,'Mario','assistant'),
(6,'Luigi','assistant'),
(7,'Waluigi','principal'),
(8,'Toad','principal'),
(9,'Wario','principal'),
(10,'Bowser','principal'),
(11,'Wilton Pereira Sampaio','principal');

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
    (Nom, EquipeID, Numero)
VALUES
    ('joeurC8', 8, 1),
    ('JoueurC2', 1, 2),
    ('JoueurD2',2, 2),
    ('JoeurG10',10,3),
    ('JoueurD3',3, 2),
    ('JoueurC4',4, 1),
    ('JoueurG4',4, 3),
    ('JoueurG6',6, 3),
    ('JoueurC7',7, 1),
    ('JoueurG7',7, 3),
    ('JoueurD9',9, 2);
   



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