package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class But {
    @Id
    private int butID;
    private int joueurID;
    private int passeID;
    private int matchID;
    private int marqueurID;

    public String toString() {
        return butID + ", " + joueurID + ", " + passeID + ", " + matchID + ", " + marqueurID;
    }
}
