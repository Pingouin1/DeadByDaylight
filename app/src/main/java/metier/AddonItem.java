package metier;

public class AddonItem{

    //attributs privés
    private String nomAddonItem;
    private String descAddonItem;

    //constructeur
    public AddonItem(String nomAddonItem, String descAddonItem) {
        this.nomAddonItem = nomAddonItem;
        this.descAddonItem = descAddonItem;
    }

    //méthodes publiques
    public String getNomAddonItem() {
        return nomAddonItem;
    }

    public String getDescAddonItem() {
        return descAddonItem;
    }
}