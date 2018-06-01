package metier;

import java.util.ArrayList;

public class Item {

    //attributs privés
    private String nomItem;
    private String descItem;

    private ArrayList<AddonItem> lesAddonItem; //les add-on possibles de l'item

    //constructeur
    public Item(String nomItem, String descItem) {
        this.nomItem = nomItem;
        this.descItem = descItem;
    }

    //méthodes publiques
    public String getNom() {
        return nomItem;
    }

    public String getDescription() {
        return descItem;
    }

}
