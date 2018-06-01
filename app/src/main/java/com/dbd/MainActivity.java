package com.dbd;

import android.content.Intent;
import android.media.MediaPlayer;
import android.support.constraint.ConstraintLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    private Button survivant;
    private Button tueur;
    private ImageView sonOn;
    private ImageView sonOff;
    private ConstraintLayout monMainLayout;
    private MediaPlayer player;



    @Override
    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        this.monMainLayout = (ConstraintLayout) findViewById(R.id.mainLayout);

        survivant = (Button) findViewById(R.id.btn_survivant);
        tueur = (Button) findViewById(R.id.btn_tueur);

        survivant.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent affSurvivant = new Intent(getApplicationContext(),ListeSurvivants.class);
                startActivity(affSurvivant);
            }
        });

        tueur.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent affTueur = new Intent(getApplicationContext(),ListeTueurs.class);
                startActivity(affTueur);
            }
        });





        // GESTION DU SON --------------------------------------------------

        //Music Player
        player = MediaPlayer.create(this, R.raw.dbd_menu_theme_piano);
        player.setLooping(true); // Set looping
        player.setVolume(100,100);
        player.start();

        //quand on clique sur l'icône son_on, on coupe le son et on affiche l'icône son_off
        sonOn = (ImageView) findViewById(R.id.btn_son_on);
        sonOff = (ImageView) findViewById(R.id.btn_son_off);
        //on désaffiche sonOff par défaut au début
        //sonOff.setImageResource(android.R.color.transparent);
        sonOff.setVisibility(View.INVISIBLE);

        //au clic sur sonOn on passe en sonOff
        sonOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //on coupe le son
                player.pause();

                //on désaffiche sonOn
                //sonOn.setImageResource(android.R.color.transparent);
                sonOn.setVisibility(View.INVISIBLE);

                //on raffiche non dynamiquement son_off
                //sonOff = findViewById(R.id.btn_son_off);
                sonOff.setVisibility(View.VISIBLE);
            }
        });//fin listener sonOn


        //au clic sur sonOff -> sonOn
        sonOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //on remet le son
                player.start();

                //on raffiche sonOn (affiché de base)
                //sonOn = findViewById(R.id.btn_son_on);
                sonOn.setVisibility(View.VISIBLE);

                //on désaffiche son_off
                //sonOff.setImageResource(android.R.color.transparent);
                sonOff.setVisibility(View.INVISIBLE);
            }
        });//fin listener sonOff


    } //fin onCreate()

    @Override
    public boolean supportRequestWindowFeature(int featureId) {
        return super.supportRequestWindowFeature(featureId);
    }




/*
    @Override
    protected void doInBackground() {
        MediaPlayer player = MediaPlayer.create(MainActivity.this, R.raw.dbd_menu_theme_piano);
        player.setLooping(true); // Set looping
        player.setVolume(100,100);
        player.start();


    }
*/

}
