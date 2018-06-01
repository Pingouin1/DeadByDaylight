package com.dbd;


import android.os.AsyncTask;
import android.util.Log;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

/**
 * Created by sarradin on 05/05/2018.
 */

public class AccesHTTP extends AsyncTask<String,Integer,Long> {
    //Connexion en tâche de fond
    //dans un thread à part

    private ArrayList<NameValuePair> parametres ;
    private String retour = null;

    //on utilise l'interface pour avoir la réponse
    //à l'extérieur du thread
    //private AsyncResponse deleguer = null;
    public AsyncResponse deleguer = null;



    //CONSTRUCTEUR
    public AccesHTTP(){
        parametres = new ArrayList<NameValuePair>();
    }

    //CONSTRUCTEUR 2 test, polymorphisme
    public AccesHTTP(AsyncResponse delegate){
        this.deleguer = delegate;
    }

    //avant de contacter le serveur distant
    //il faut des paramètres POST
    public void addParam(String nom, String valeur){
        //comme une classe abstraite ne s'instancie pas
        //obligation de prendre une classe fille de NameValuePair
        parametres.add(new BasicNameValuePair(nom, valeur));
    }


    @Override
    protected Long doInBackground(String... strings) {

        HttpClient cnxHttp = new DefaultHttpClient();
        HttpPost paramCnx = new HttpPost(strings[0]);

        try {
            //encodage des param
            paramCnx.setEntity(new UrlEncodedFormEntity(parametres));

            //connexion et envoi des param, attente de réponse
            HttpResponse reponse = cnxHttp.execute(paramCnx);

            //transformation de la réponse
            retour = EntityUtils.toString(reponse.getEntity());

        } catch (UnsupportedEncodingException e) {
            Log.d("erreur encodage","*******"+e.toString());
            //e.printStackTrace();
        } catch (ClientProtocolException e) {
            Log.d("erreur protocole","*******"+e.toString());
            e.printStackTrace();
        } catch (IOException e) {
            Log.d("erreur Input/Output","******entree_sortie_serveur**"+e.toString());
            e.printStackTrace();
        }

        return null;
    }//fin doInBackground()

    @Override
    protected void onPostExecute(Long result){
        //on appelle une méthode à l'extérieur du thread
        //grâce à notre classe interface AsyncResponse
        deleguer.processFinish(retour.toString());
    }

}
