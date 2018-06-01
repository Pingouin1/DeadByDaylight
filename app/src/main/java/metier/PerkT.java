package metier;

public class PerkT{

    //attributs privés
    private String nomPerkTueur;
    private String descPerkTueur;

    //constructeur
    public PerkT(String nomPerkTueur, String descPerkTueur) {
        this.nomPerkTueur = nomPerkTueur;
        this.descPerkTueur = descPerkTueur;
    }

    //méthodes publiques
    public String getNomPerkTueur() {
        return nomPerkTueur;
    }

    public String getDescPerkTueur() {
        return descPerkTueur;
    }
}
