package projet.projetift2935;

import jakarta.persistence.*;

@Entity
public class MembreStaffTechnique {
    @Id
    private int membreStaffID;
    private String role;
    private String nom;
    private int equipeID;

    public String toString() {
        return membreStaffID + ", " + role + ", " + nom + ", " + equipeID;
    }
}
