package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Marqueur {
    @Id
    private int marqueurID;
    private String nomJoueurBut;

    public String toString() {
        return marqueurID + ", " + nomJoueurBut;
    }
}
