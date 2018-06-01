package com.dbd;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Toast;

import org.json.JSONArray;

import java.util.ArrayList;

import metier.Tueur;

import static com.dbd.Controller.getSERVERADDR;

public class ListeTueurs extends ListActivity implements AdapterView.OnItemClickListener, AsyncResponse {

    private ArrayList<Tueur> lesTueurs = new ArrayList<Tueur>();
    private ArrayList<String> lesTueursNoms = new ArrayList<String>();
    private static AccesDistant accesDistant;//cet objet permet de dialoguer avec le serveur


    AccesHTTP asyncTaskHTTP =new AccesHTTP(); //pour récupérer les données de l'asyncTask


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste_tueurs);


        accesDistant = new AccesDistant();//on instancie l'accès au SERVEUR
        //on envoie l'ordre de récupération des tueurs, ce n'est pas un envoi de données ici, on va les récupérer ensuite
        Log.d("ope recupListeTueurs","******opération récupérer les tueurs...");
        accesDistant.envoi("tueurs",new JSONArray());



        asyncTaskHTTP.deleguer = this; //on set le deleguer ici à this
        asyncTaskHTTP.execute(getSERVERADDR()); //execute l'async task AccesHTTP

    }//fin onCreate()

    //réécriture méthode interface AsyncResponse
    @Override
    public void processFinish(String retourOutputServer) {

        Log.d("ListeTueurs recupdAccD","*******"+retourOutputServer);

        //affichage test des infos d'accès distant (fille asyncResponse)
        int duration = Toast.LENGTH_LONG;
        Toast toast = Toast.makeText(getApplicationContext(), Controller.getInstance(getApplicationContext()).getLesSurnoms(), duration);
        toast.show();

        init_liste();

        ArrayAdapter<String> adapt = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, lesTueursNoms);
        setListAdapter(adapt);

        //c'est l'héritage de ListActivity qui permet d'avoir la méthode getListView()
        getListView().setOnItemClickListener(this); //il set depuis notre méthode overriden

    }//fin processFinish()



    //init_liste() : liste la Collection des survivants
    protected void init_liste() {
        Log.i("listeinit", "la liste est initialisée...");

        for( Tueur t : Controller.getInstance(getApplicationContext()).getLesTueurs() ){
            lesTueurs.add(t);
        }

        Log.i("lesTueurs", lesTueurs.toString());

        for (Tueur lt : lesTueurs) {
            lesTueursNoms.add((String) lt.getNom() + " " + (String) lt.getPrenom() +
                    " alias "+lt.getSurnom()+"");
        }
        Log.i("lesTueursNoms", lesTueursNoms.toString());
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

        //on va ouvrir l'activité unTueur avec la photo du même nom
        //on crée donc un Intent pour envoyer les données
        Intent afficheLeTueur = new Intent(getApplicationContext(),LeTueur.class);

        //envoyer des données dans l'Activity suivante (LeTueur) avec
        //notreIntent.putExtra("etiquette",donnee);
        afficheLeTueur.putExtra("nom",lesTueurs.get(i).getNom());
        afficheLeTueur.putExtra("prenom",lesTueurs.get(i).getPrenom());
        afficheLeTueur.putExtra("histoire",lesTueurs.get(i).getHistoire());
        afficheLeTueur.putExtra("indice",i);

        startActivity(afficheLeTueur);
    }
}
