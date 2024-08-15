package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Stade {
    @Id
    private String nomDuStade;
    private String pays;
    private String ville;

    public String toString() {
        return nomDuStade + ", " + pays + ", " + ville;
    }
}
