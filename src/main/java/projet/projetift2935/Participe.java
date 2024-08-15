package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Participe {
    @Id
    private int participeID;
    private int equipeID;
    private int matchID;

    public String toString() {
        return participeID + ", " + equipeID + ", " + matchID;
    }
}
