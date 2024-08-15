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
Select jo.Nom, Jo.Numero, Jo.Position, eq.Pays, eq.annee, count(bu.ButID) as total_but
from joueur jo
left join Equipe eq on jo.EquipeID = eq.EquipeID
left join But bu on jo.JoueurID=bu.JoueurID
group by jo.JoueurID, eq.EquipeID
order by total_but DESC
LIMIT 3;

-- Requête 3
-- Montre les équipes en ordre alphabétique de pays avec leur nombre de but et de passe
-- Donne les infos de l'équipe ainsi que le nombre total de but et le nombre total de passe
Select eq.*, count (bu.JoueurID) as total_but, count(bu.PasseID) as total_passe
from Equipe eq
left join Joueur jo on eq.EquipeID = jo.EquipeID
Left join But bu on jo.JoueurID = bu.JoueurID
group by eq.EquipeID
order by eq.pays;

-- Requête 4
-- Affiche les informations techniques de chaque match
-- Donne la date, le scoreÉquipe1, le scoreÉquipe2, le rank, le nom (nom arbitre), le nom du stade, le pays et la ville
Select ma.date,ma.scoreEquipe1,ma.scoreEquipe2,ma.rank,ar.nom,st.nomdustade, st.pays, st.ville
from Match ma
inner join Gere ge on ma.MatchID = ge.MatchId
inner join Arbitre ar on ge.ArbitreID = ar.ArbitreID and ar.role = 'principal'
inner join Stade st on ma.Stade = st.NomDuStade;