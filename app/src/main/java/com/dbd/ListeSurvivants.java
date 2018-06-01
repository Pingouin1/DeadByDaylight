package com.dbd;

import android.app.ListActivity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Toast;

import org.json.JSONArray;

import java.util.ArrayList;

import metier.Item;
import metier.Pouvoir;
import metier.Survivant;
import metier.Tueur;

import static com.dbd.Controller.getSERVERADDR;

public class ListeSurvivants extends ListActivity implements AdapterView.OnItemClickListener, AsyncResponse {

    private ArrayList<Survivant> lesSurvivants = new ArrayList<Survivant>();
    private ArrayList<String> lesSurvivantsNoms = new ArrayList<String>(); //prénom et nom
    private MediaPlayer player_btn = new MediaPlayer();
    //test avec notre classe MusicPlayer
    //private MusicPlayer player_btn = new MusicPlayer(this, R.raw.dbd_sound_button2, false, 100,100);
    private static AccesDistant accesDistant;//cet objet permet de dialoguer avec le serveur

    AccesHTTP asyncTaskHTTP =new AccesHTTP(); //pour récupérer les données de l'asyncTask


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste_survivants);


        //on instancie l'accès au SERVEUR
        accesDistant = new AccesDistant();
        //on envoie simplement l'ordre de récupération des tueurs, ce n'est pas un envoi de données ici, on va les récupérer ensuite.
        Log.d("operation survivants","******on va récupérer les survivants...");
        accesDistant.envoi("survivants",new JSONArray());


        asyncTaskHTTP.deleguer = this; //on set le deleguer ici à this
        asyncTaskHTTP.execute(getSERVERADDR()); //execute l'async task AccesHTTP
    }//fin onCreate()



    @Override
    public void processFinish(String retourOutputServer){
        Log.d("ListeSurv recupdAccD","*******"+retourOutputServer);

        init_liste();

        ArrayAdapter<String> adapt = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, lesSurvivantsNoms);
        setListAdapter(adapt);

        //c'est l'héritage de ListActivity qui permet d'avoir la méthode getListView()
        getListView().setOnItemClickListener(this); //il set depuis notre méthode overriden

    }//fin processFinish


    protected void init_liste() {
        Log.i("listeinit","la liste est initialisée...");

        for(Survivant ls : Controller.getInstance(getApplicationContext()).getLesSurvivants()){
            lesSurvivants.add(ls);
            lesSurvivantsNoms.add(ls.getPrenom() + " " + ls.getNom() +"");
        }
        Log.i("collecListeSurvivants",lesSurvivants.toString());
        Log.i("colleclesSurvivantsNoms",lesSurvivantsNoms.toString());

    }


    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        //Toast msg = null;
        //msg.makeText(getApplicationContext(), "Vous avez cliqué sur " + i, Toast.LENGTH_LONG).show();


        //ajout son au clic sur l'item
        player_btn = MediaPlayer.create(this, R.raw.dbd_sound_button);
        player_btn.setLooping(false); // Set looping
        player_btn.setVolume(900,900);
        player_btn.start();


        //test avec notre classe...
        //player_btn = MusicPlayer.create(this, R.raw.dbd_sound_button2);
        //player_btn.start();



        //on va ouvrir l'activité unSurvivant au clic
        //on crée donc un Intent pour envoyer les données
        Intent afficheLeSurvivant = new Intent(getApplicationContext(),LeSurvivant.class);

        //envoyer des données dans l'Activity suivante avec
        //notreIntent.putExtra("etiquette",donnee);
        afficheLeSurvivant.putExtra("nom",lesSurvivants.get(i).getNom());
        afficheLeSurvivant.putExtra("prenom",lesSurvivants.get(i).getPrenom());
        afficheLeSurvivant.putExtra("histoire",lesSurvivants.get(i).getHistoire());
        afficheLeSurvivant.putExtra("indice",i);

        startActivity(afficheLeSurvivant);


    }
}
