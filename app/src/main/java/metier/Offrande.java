package metier;

public class Offrande {

    //attributs privés
    private String nomOffrande;
    private String descOffrande;
    private String asssociation;

    //constructeur
    public Offrande(String nomOffrande, String descOffrande, String asssociation) {
        this.nomOffrande = nomOffrande;
        this.descOffrande = descOffrande;
        this.asssociation = asssociation;
    }

    //méthodes publiques
    public String getNom() {
        return nomOffrande;
    }

    public String getDescription() {
        return descOffrande;
    }

    public String getAsssociation() {
        return asssociation;
    }
}
