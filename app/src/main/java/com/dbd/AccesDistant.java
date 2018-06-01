package com.dbd;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;

import java.util.ArrayList;
import java.util.List;

import metier.Tueur;
import metier.Survivant;

import static com.dbd.Controller.getSERVERADDR;


public class AccesDistant implements AsyncResponse {

    //constante : adresse du serveur ou de notre ordi si on accède à WAMP en local
    private static final String SERVERADDR = getSERVERADDR();



    private ArrayList<Tueur> lesTueurs = new ArrayList<Tueur>();
    private ArrayList<Survivant> lesSurvivants = new ArrayList<Survivant>();
    private Context context;
    private JSONObject jObjUnit, jObjComplet;
    private JSONArray lesPersonnages;
    private Tueur temp;
    private Survivant tempSurvivant;
    private Tueur tempTueur;

    String lesSurnoms="";


    //CONSTRUCTEUR
    public AccesDistant(){
        super();
        //this.context=Context.MODE_PRIVATE;
    }


    //va s'exécuter au retour du serveur distant
    @Override
    public void processFinish(String outputServer) {
        Log.d("retour AccesDistant","*******"+outputServer);

        //découpage du message reçu avec %. Dans message[0] on aura soit "tueurs", soit "survivants", soit "erreur"... et dans message[1], le reste du message
        String[] message = outputServer.split("%");

        //s'il y a bien un tableau d'au moins 2 indices
        if(message.length>1){
            Log.d("est dans le if","***on est dans le if d'AccesDistant processFinish...");
            if(message[0].equals("tueurs")){
                Log.d("recupTueurs AccDistant","**************"+message[1]);//OK!

                String ficPersonnages = message[1];
                Log.i("recup string",ficPersonnages);
                // Transformation de la chaîne obtenue en objet JSON générique
                jObjComplet = parsePersonnages(ficPersonnages);
                // Mise en forme de l'Objet JSON avec la structure attendue (personnages)
                lesPersonnages = recupTueurs(jObjComplet);
                //Log.i("jsonarray",lesPersonnages.toString());

                // Parcours séquentiel du tableau JSON pour obtenir des instances "métier"
                String leSurnom, leNom, lePrenom, laHistoire;
                for(int i=0; i<lesPersonnages.length(); i++){
                    try {
                        jObjUnit = lesPersonnages.getJSONObject(i);

                        leSurnom = jObjUnit.getString("surnom");
                        leNom = jObjUnit.getString("nom");
                        lePrenom = jObjUnit.getString("prenom");
                        laHistoire = jObjUnit.getString("histoire");

                        tempTueur = new Tueur(leSurnom, lePrenom, leNom, laHistoire);

                        lesTueurs.add(tempTueur);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                //ON SET LA COLLECTION lesTueurs DEPUIS LA BDD
                Controller.getInstance(context).setTueurs(lesTueurs);
                Log.d("setLesTueurs AccD",lesTueurs.toString());

                for(Tueur unTueur : lesTueurs){
                    Log.i("testTueurs", unTueur.getSurnom());
                    lesSurnoms+=unTueur.getSurnom()+"#";
                }

                Controller.getInstance(context).setSurnoms(lesSurnoms); //.getInstance(context)

            } else if(message[0].equals("survivants")){
                Log.d("recupSurvivants","**************"+message[1]);
                String ficPersonnages = message[1];
                Log.i("recup string",ficPersonnages);
                // Transformation de la chaîne obtenue en objet JSON générique
                jObjComplet = parsePersonnages(ficPersonnages);
                // Mise en forme de l'Objet JSON avec la structure attendue (personnages)
                lesPersonnages = recupSurvivants(jObjComplet);
                //Log.i("jsonarray",lesPersonnages.toString());

                // Parcours séquentiel du tableau JSON pour obtenir des instances "métier"
                String leNom, lePrenom, laHistoire;
                for(int i=0; i<lesPersonnages.length(); i++){
                    try {
                        jObjUnit = lesPersonnages.getJSONObject(i);

                        leNom = jObjUnit.getString("nom");
                        lePrenom = jObjUnit.getString("prenom");
                        laHistoire = jObjUnit.getString("histoire");

                        tempSurvivant = new Survivant(lePrenom, leNom, laHistoire);
                        //temp = new Personnage(jObjUnit.getString("nom"), jObjUnit.getString("topo"));

                        lesSurvivants.add(tempSurvivant);
                        //Log.i("tableau", lesPersos.toString());
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }

                //ON SET LA COLLECTION lesSurvivants DEPUIS LA BDD
                Controller.getInstance(context).setSurvivants(lesSurvivants);

                for(Survivant unSurvivant : lesSurvivants){
                    Log.i("testSurvivants", unSurvivant.getNom());
                }
            } else if(message[0].equals("enregItem")){
                Log.d("enregItem","**************"+message[1]);

            } else if(message[0].equals("Erreur")){
                Log.d("erreurPHP","**************"+message[1]);

            }
        }

    }//fin processFinish()


    //Méthode d'envoi de l'ordre HTTP (soit pour insert soit pour select, etc)
    //si on envoie des données (POST), c'est en JSON,
    //sinon (GET) on met un tableau JSON vide, new JSONArray()
    public void envoi(String ope, JSONArray lesDonneesJSON){ //il faudra envoyer les données en JSON au serveur
        AccesHTTP accesHTTP = new AccesHTTP();

        //on fait le lien de délégation
        accesHTTP.deleguer = this;

        accesHTTP.addParam("operation",ope);   //le "operation" est la clef du tableau $_REQUEST["operation"]
        accesHTTP.addParam("donnees",lesDonneesJSON.toString());

        //appel au serveur
        accesHTTP.execute(SERVERADDR); //la méthode execute() de l'AsyncTask appelle le doInBackground()
    }


    public JSONArray convertToJSONArray(List laListe){
        return new JSONArray(laListe);
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    private JSONArray recupTueurs(JSONObject jObjComplet) {
        JSONArray mesPersos = null;
        try {
            mesPersos = jObjComplet.getJSONArray("tueurs");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return mesPersos;
    }

    private JSONArray recupSurvivants(JSONObject jObjComplet) {
        JSONArray mesPersos = null;
        try {
            mesPersos = jObjComplet.getJSONArray("survivants");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return mesPersos;
    }

    private JSONObject parsePersonnages(String ficPersonnages) {
        JSONObject j = null;
        if(!ficPersonnages.isEmpty()) {
            try {
                j = new JSONObject(ficPersonnages);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        //Log.i("parse",j.toString());
        return j;
    }


}//fin class AccesDistant
