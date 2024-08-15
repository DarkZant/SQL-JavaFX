package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Passeur {
    @Id
    private int passeID;
    private String nomJoueurPasse;

    public String toString() {
        return passeID + ", " + nomJoueurPasse;
    }
}
