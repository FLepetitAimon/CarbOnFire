package com.example.carbonfire.controller;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.lifecycle.ViewModelProvider;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.AnimationDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.carbonfire.R;
import com.example.carbonfire.View.DeviceItemAdapter;
import com.example.carbonfire.model.MySharedViawModel;


public class MainActivity extends AppCompatActivity {


    //************************************
    //**    Initialisation des objets   **
    //************************************

    //objet bluetooth
    public BluetoothSocket mmSocket;
    public BluetoothDevice mmDevice;

    //Thread
    MyBluetoothtService.ConnectedThread mmConnectedThread;
    ConnectThread mmConnectThread ;

    //elements graphiques
    ImageButton deviceBtn ;
    TextView afficheurCO2, afficheurTemp, afficheurCO, afficheurEtatConnexion, afficheurNomDevice;
    ImageView connexionImageView;

    //variables
    private byte[] mmBuffer = new byte[1024];
    private int NbBytesRecu;
    private int NbBytesRecu_aux = 0;
    private String trame;


    //************************************
    //** communication avec les thread  **
    //************************************

    final private Handler mHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {

            super.handleMessage(msg);
            //les threads communiquent avec l'activité par le handler et la variable 'msg'

            // arg = 0 : le socket est connecté avec l'appareil bluetooth selectionné
            if(msg.arg1==0){
                Toast.makeText(MainActivity.this, (String) msg.obj, Toast.LENGTH_SHORT).show();
                connexionImageView.setImageResource(R.drawable.connectee_logo);
                connexionImageView.clearAnimation();
                afficheurEtatConnexion.setText("Connected");
                mmSocket= mmConnectThread.GetSocket();

                mmConnectedThread = new MyBluetoothtService.ConnectedThread(mmSocket,mHandler);
                mmConnectedThread.start();
            }


            //arg = 1 : nouvelle trame reçu
           if(msg.arg1==1){

               NbBytesRecu = msg.getData().getInt("NombreBytesRecu");
               if (NbBytesRecu+NbBytesRecu_aux < 1024) {

                   for (int i = NbBytesRecu_aux; i < (NbBytesRecu_aux + NbBytesRecu); i++) {
                       mmBuffer[i] = msg.getData().getByteArray("TrameBluetooth")[i - NbBytesRecu_aux];
                   }
               }
               else mmBuffer = new byte[1024];

               trame = new String(mmBuffer);
               String SerieMesure[] = trame.split(",");
               if (SerieMesure.length>1) {
                   String Mesure[] = SerieMesure[SerieMesure.length-2].split(";");
                   if (Mesure.length>2) {

                      afficheurCO.setText(Mesure[0] + " ppm");
                       afficheurCO2.setText(Mesure[1] + " ppm");
                       afficheurTemp.setText(Mesure[2] + " °C");
                       mmBuffer = new byte[1024];
                       NbBytesRecu_aux = 0;
                   }
                   else {
                      NbBytesRecu_aux = NbBytesRecu + NbBytesRecu_aux;
                   }


               }
               else {
                   NbBytesRecu_aux = NbBytesRecu + NbBytesRecu_aux;
               }
           }


            //arg = 2 : la connexion du socket à échouée
            if(msg.arg1==2){
                connexionImageView.setImageResource(R.drawable.icone_deconnecter);
                connexionImageView.clearAnimation();
                afficheurEtatConnexion.setText("Disconnected");
                afficheurNomDevice.setText("Connexion failed");
            }



           //arg = 3 : la connexionn à été perdue
           if (msg.arg1 == 3){
               connexionImageView.setImageResource(R.drawable.icone_deconnecter);
               connexionImageView.clearAnimation();
               afficheurEtatConnexion.setText("Disconnected");
               afficheurNomDevice.setText("Connexion lost");
               afficheurCO.setText("- ppm");
               afficheurCO2.setText("- ppm");
               afficheurTemp.setText("- °C");
               mmConnectedThread.cancel();
           }


        }
    };



    //*************************
    //** Début du programme  **
    //*************************


    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        //------------  Initialisation des éléments graphiques  -----------------

        deviceBtn = (ImageButton) findViewById(R.id.device_btn);
        afficheurCO = (TextView) findViewById(R.id.AfficheurCO);
        afficheurCO2 = (TextView) findViewById(R.id.AfficheurCO2);
        afficheurTemp = (TextView) findViewById(R.id.AfficheurTemp);
        afficheurEtatConnexion = (TextView) findViewById(R.id.TextViewEtatDeConnexion);
        afficheurNomDevice = (TextView) findViewById(R.id.TextViewDeviceName);
        connexionImageView = (ImageView) findViewById(R.id.ImageViewConnecteeLogo);



        // -------------- Gestion des Permissions ------------------------------

        if (ContextCompat.checkSelfPermission(
                MainActivity.this, Manifest.permission.BLUETOOTH_ADMIN) ==
                PackageManager.PERMISSION_GRANTED) {
            // You can use the API that requires the permission.
        }
        else {
            // You can directly ask for the permission.
            // The registered ActivityResultCallback gets the result of this request.
            requestPermissionLauncher.launch(
                    Manifest.permission.BLUETOOTH_ADMIN);
        }

        if (ContextCompat.checkSelfPermission(
                MainActivity.this, Manifest.permission.ACCESS_FINE_LOCATION) ==
                PackageManager.PERMISSION_GRANTED) {
            // You can use the API that requires the permission.
        }
        else {
            // You can directly ask for the permission.
            // The registered ActivityResultCallback gets the result of this request.
            requestPermissionLauncher.launch(
                    Manifest.permission.ACCESS_FINE_LOCATION);
        }





        //-----------  Gestion du bouton de choix de d'appareil  --------------------

        deviceBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!(mmSocket== null)){
                    mmConnectThread.cancel();
                }
                Intent ActivityDevice = new Intent (MainActivity.this, ActivityDevice.class);
                DeviceActivityResultLauncher.launch(ActivityDevice);
            }

        });



    }

    // -------------------  Gestion du résultat de l'activité Device  --------------------------------------------

    ActivityResultLauncher<Intent> DeviceActivityResultLauncher = registerForActivityResult(
            new ActivityResultContracts.StartActivityForResult(),
            new ActivityResultCallback<ActivityResult>() {
                @Override
                public void onActivityResult(ActivityResult result) {
                    if (result.getResultCode() == 1) {
                        Bundle bundle = result.getData().getExtras();
                        mmDevice = (BluetoothDevice) bundle.get("MyDEVICE");

                        connexionImageView.setImageResource(R.drawable.icone_chargement);
                        connexionImageView.startAnimation(AnimationUtils.loadAnimation(MainActivity.this, R.anim.rotation));

                        afficheurEtatConnexion.setText("Connexion in progress ...");
                        afficheurNomDevice.setText(mmDevice.getName());

                        mmConnectThread = new ConnectThread(mmDevice, mHandler);
                        mmConnectThread.start();
                    }
                }



            });




// ----------  Resultats de la demande d'accès à la localisation  --------------------------------------------------------------

    private ActivityResultLauncher<String> requestPermissionLauncher =
            registerForActivityResult(new ActivityResultContracts.RequestPermission(), isGranted -> {
                if (isGranted) {
                    Toast.makeText(MainActivity.this, "Localisation permission granted", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(MainActivity.this, "Localisation permission denied", Toast.LENGTH_LONG).show();
                }
            });


    // -----------------------  Fin de vie de l'application  -----------------------------------------

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mmConnectedThread.cancel();
    }
}