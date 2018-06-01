package metier;

public class AddonPouvoir{

    //attributs privés
    private int idAddonPouvoir;
    private String nomAddonPouvoir;
    private String descAddonPouvoir;

    //constructeur
    public AddonPouvoir(String nomAddonPouvoir, String descAddonPouvoir, Pouvoir pouvoir) {
        this.nomAddonPouvoir = nomAddonPouvoir;
        this.descAddonPouvoir = descAddonPouvoir;
    }

    //méthodes publiques
    public int getIdAddonPouvoir(){
        return idAddonPouvoir;
    }

    public String getNomAddonPouvoir() {
        return nomAddonPouvoir;
    }

    public String getDescAddonPouvoir() {
        return descAddonPouvoir;
    }

}
