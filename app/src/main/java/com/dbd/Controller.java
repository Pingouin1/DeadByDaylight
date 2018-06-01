package com.dbd;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.ArrayList;

import metier.Survivant;
import metier.Tueur;

public final class Controller {

    private static Controller instance = null;
    private static String lesSurnoms;
    private static ArrayList<Tueur> lesTueurs;
    private static ArrayList<Survivant> lesSurvivants;
    private static AccesDistant accesDistant;

    //CONSTRUCTEUR
    private Controller(){
        super();
    }

    public static final Controller getInstance(Context contexte){
        if(Controller.instance==null){
            Controller.instance = new Controller();
            accesDistant = new AccesDistant();
        }
        return Controller.instance;
    }


    //NOS METHODES POUR PASSER LES DONNEES AUX ACTIVITIES

    public static void setSurnoms(String surnoms){
       lesSurnoms=surnoms;
    }

    public static String getLesSurnoms(){
        return lesSurnoms;
    }

    public static void setTueurs(ArrayList<Tueur> lesT){
        lesTueurs=lesT;
    }

    public static ArrayList<Tueur> getLesTueurs(){
        return lesTueurs;
    }

    public static void setSurvivants(ArrayList<Survivant> lesS){
        lesSurvivants=lesS;
    }

    public static ArrayList<Survivant> getLesSurvivants(){
        return lesSurvivants;
    }

    public static final String getSERVERADDR(){
        //SERVEUR LOCAL
       //String SERVERADDR = "http://192.168.56.1/dbd_acces/server_dbd.php";

        //SERVEUR DISTANT
        //String SERVERADDR = "http://btssio17.com/dbd/server_dbd.php";
        String SERVERADDR = "https://howtoplaydbd.000webhostapp.com/dbd_acces/server_dbd.php";

        return SERVERADDR;
    }

}
