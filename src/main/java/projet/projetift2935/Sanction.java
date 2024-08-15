package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Sanction {
    @Id
    private int sanctionID;
    private int joueurID;
    private int matchID;
    private String couleurCarton;

    public String toString() {
        return sanctionID + ", " + joueurID + ", " + matchID + ", " + couleurCarton;
    }
}
