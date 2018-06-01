package com.dbd;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class LeSurvivant extends AppCompatActivity {

    TextView leSurvivant;
    TextView laDescr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_le_survivant);

        Bundle extras = getIntent().getExtras();

        String prenom = extras.getString("prenom");
        String nom = extras.getString("nom");
        String descr = extras.getString("histoire");
        String idSurvivant = extras.getString("indice");

        leSurvivant=(TextView) findViewById(R.id.xsurvivant);
        leSurvivant.setText(prenom + " " + nom);

        laDescr = (TextView) findViewById(R.id.xdescription);
        laDescr.setText(descr);
    }
}
