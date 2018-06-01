package metier;

import java.util.ArrayList;

public class Tueur extends Personnage {

    //attributs privés
    private String surnomTueur;
    //prénom, nom et histoire de la classe mère
    private ArrayList<PerkT> lesPerksTueur; //chaque tueur a des perks

    //constructeur
    public Tueur(String surnomTueur, String prenomTueur, String nomTueur, String histoireTueur) {
        super(prenomTueur,nomTueur,histoireTueur);
        this.surnomTueur = surnomTueur;
    }

    //méthodes publiques
    public String getSurnom() {
        return surnomTueur;
    }

    public ArrayList<PerkT> getLesPerksTueur() {
        return lesPerksTueur;
    }

    public void setLesPerksTueur(ArrayList<PerkT> lesPerksTueur) {
        this.lesPerksTueur = lesPerksTueur;
    }

    @Override
    public String toString() {
        return " Le tueur est surnommé " + surnomTueur;
    }


}
