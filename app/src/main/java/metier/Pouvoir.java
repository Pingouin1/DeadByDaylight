package metier;

import java.util.ArrayList;

public class Pouvoir {

    //attributs privés
    private String nom_po ;
    private String descr_po;
    private Tueur tueur;

    private ArrayList<AddonPouvoir> lesAddonsPouvoir ; //les add-on possibles du pouvoir du Tueur

    //constructeur
    public Pouvoir(String pnom, String pdescr, Tueur ptueur) {
        this.nom_po = pnom;
        this.descr_po = pdescr;
        this.tueur=ptueur;
    }

    //méthodes publiques
    public String getNom() {
        return nom_po;
    }

    public String getDescription() {
        return descr_po;
    }

    public Tueur getTueur(){ return tueur; }

    public ArrayList<AddonPouvoir> getLesAddonT() {
        return lesAddonsPouvoir;
    }
}
