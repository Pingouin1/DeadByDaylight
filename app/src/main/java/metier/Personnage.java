package metier;

public class Personnage { //classe mère de Survivant et Tueur

    //attributs privés
    private String prenom;
    private String nom;
    private String histoire;

    public Personnage(String prenom, String nom, String histoire) {
        this.prenom = prenom;
        this.nom = nom;
        this.histoire = histoire;
    }


    //GETTERS ET SETTERS
    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getHistoire() {
        return histoire;
    }

    public void setHistoire(String histoire) {
        this.histoire = histoire;
    }

    @Override
    public String toString() {
        return "Le personnage se nomme " +
                 prenom + " " + nom +
                ". Voici son histoire : '" + histoire ;
    }
}
