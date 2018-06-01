package com.dbd;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.Uri;
import android.view.View;
import android.widget.ImageView;

/**
 * Created by sarradin on 20/01/2018.
 */

public class MusicPlayer extends MediaPlayer {

    Context context;
    Uri uri;
    private Boolean looping;
    private float volumeG;
    private float volumeD;


    public MusicPlayer(Context context, Uri uri, Boolean plooping, float pvolumeG, float pvolumeD) {
        super();
        setLooping(plooping);
        setVolume(pvolumeG,pvolumeD);
    }



    @Override
    public void setLooping(boolean looping) {
        super.setLooping(looping);
    }

    @Override
    public void setVolume(float volumeG, float volumeD) {
        super.setVolume(volumeG, volumeD);
    }

    //Music Player
    /*
    player = MediaPlayer.create(this, R.raw.dbd_menu_theme_piano);
        player.setLooping(true); // Set looping
        player.setVolume(200,200);
        player.start();
        */

}
