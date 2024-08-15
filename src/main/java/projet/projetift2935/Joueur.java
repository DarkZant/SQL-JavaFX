package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class Joueur {
    @Id
    private int joueurID;
    private String nom;
    private int numero;
    private String position;
    private int equipeID;

    public String toString() {
        return joueurID + ", " + nom + ", " + numero + ", " + position + ", " + equipeID;
    }
}
