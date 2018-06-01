package metier;

public class PerkS{

    //attributs privés
    private String nomPerkSurvivant;
    private String descPerkSurvivant;

    //constructeur
    public PerkS(String nomPerkSurvivant, String descPerkSurvivant) {
        this.nomPerkSurvivant = nomPerkSurvivant;
        this.descPerkSurvivant = descPerkSurvivant;
    }

    //méthodes publiques
    public String getNomPerkSurvivant() {
        return nomPerkSurvivant;
    }

    public String getDescPerkSurvivant() {
        return descPerkSurvivant;
    }

}
