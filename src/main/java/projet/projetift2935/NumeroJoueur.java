package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class NumeroJoueur {
    @Id
    private int numeroJoueurID;
    private String nom;
    private int numero;
    private int equipeID;

    public String toString() {
        return numeroJoueurID + ", " + nom + ", " + numero + ", " + equipeID;
    }
}
