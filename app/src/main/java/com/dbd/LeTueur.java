package com.dbd;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class LeTueur extends AppCompatActivity {

    TextView leTueur;
    TextView laDescr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_le_tueur);

        Bundle extras = getIntent().getExtras();

        String prenom = extras.getString("prenom");
        String nom = extras.getString("nom");
        String descr = extras.getString("histoire");
        String idTueur = extras.getString("indice");

        leTueur=(TextView) findViewById(R.id.xtueur);
        leTueur.setText(prenom + " " + nom);

        laDescr = (TextView) findViewById(R.id.xdescription);
        laDescr.setText(descr);
    }
}
