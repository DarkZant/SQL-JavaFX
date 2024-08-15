package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Arbitre {
    @Id
    private int arbitreID;
    private String nom;
    private String role;

    public String toString() {
        return arbitreID + ", " + nom + ", " + role;
    }
}
