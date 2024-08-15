package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Gere {
    @Id
    private int gereID;
    private int arbitreID;
    private int matchID;

    public String toString() {
        return gereID + ", " + arbitreID + ", " + matchID;
    }
}
