package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Equipe {
    @Id
    private int equipeID;
    private String pays;
    private int annee;

    public String toString() {
        return equipeID + ", " + pays + ", " + annee;
    }
}
