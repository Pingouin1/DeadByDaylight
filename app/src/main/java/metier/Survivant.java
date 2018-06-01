package metier;

import java.util.ArrayList;

public class Survivant extends Personnage {

    private ArrayList<PerkS> lesPerksS; //chaque survivant a des perks

    //constructeur
    public Survivant(String prenomSurvivant, String nomSurvivant, String histoireSurvivant) {
        super(prenomSurvivant, nomSurvivant, histoireSurvivant);
    }


}
