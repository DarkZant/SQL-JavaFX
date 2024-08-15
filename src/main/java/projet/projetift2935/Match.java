package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Match {
    @Id
    private int matchID;
    private String stade;
    private String date;
    private int scoreEquipe1;
    private int scoreEquipe2;
    private int rang;

    public String toString() {
        return matchID + ", " + stade + ", " + date + ", " + scoreEquipe1 + ", " + scoreEquipe2 + ", " + rang;
    }
}
