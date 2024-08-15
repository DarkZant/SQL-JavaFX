begin transaction;

create domain ArbitreRoleType as varchar(255) 
  check (value LIKE 'assistant' or value LIKE 'principal');
  
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