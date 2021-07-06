package com.example.carbonfire.controller;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.lifecycle.ViewModelProvider;

import android.Manifest;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.example.carbonfire.R;
import com.example.carbonfire.View.DeviceItemAdapter;
import com.example.carbonfire.model.MySharedViawModel;


public class MainActivity extends AppCompatActivity {

    private int REQUEST_CODE1 = 1;
    private int REQUEST_CODE2 ;
    private Button deviceBtn ;
    private boolean shouldShowRequestPermissionRationale = true;

    public BluetoothSocket mmSocket;
    public BluetoothDevice mmDevice;
    public final static String ACTION_PERSO = "sdz.chapitreTrois.intent.action.PERSO";
    MyBluetoothtService.ConnectedThread mmConnectedThread;
    ConnectThread mmConectThread ;
    TextView afficheurCO;
    TextView afficheurCO2;
    TextView afficheurTemp;
    private byte[] mmBuffer = new byte[1024];
    private int NbBytesRecu;
    private int NbBytesRecu_aux = 0;
    boolean TrameComplete = true;
    private String trame;
    private int taille = 2;


    final private Handler mHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {

            afficheurCO = (TextView) findViewById(R.id.AfficheurCO);
            afficheurCO2 = (TextView) findViewById(R.id.AfficheurCO2);
            afficheurTemp = (TextView) findViewById(R.id.AfficheurTemp);

            super.handleMessage(msg);
            // L'avancement se situe dans msg.arg1
            if(msg.arg1==0){
                Toast.makeText(MainActivity.this, (String) msg.obj, Toast.LENGTH_SHORT).show();
                mmSocket= mmConectThread.GetSocket();

                mmConnectedThread = new MyBluetoothtService.ConnectedThread(mmSocket,mHandler);
                mmConnectedThread.start();
            }

           if(msg.arg1==1){



               NbBytesRecu = msg.getData().getInt("NombreBytesRecu");

                   for (int i = NbBytesRecu_aux; i < (NbBytesRecu_aux+NbBytesRecu); i++) {
                       mmBuffer[i] = msg.getData().getByteArray("TrameBluetooth")[i-NbBytesRecu_aux];
                   }

               trame = new String(mmBuffer);
               String SerieMesure[] = trame.split(",");
               if (SerieMesure.length>1) {
                   String Mesure[] = SerieMesure[SerieMesure.length-2].split(";");
                   if (Mesure.length>2) {

                      afficheurCO.setText(Mesure[0]);
                       afficheurCO2.setText(Mesure[1]);
                       afficheurTemp.setText(Mesure[2]);
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


        }
    };




    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        MySharedViawModel mmSharedViawModel = new ViewModelProvider(this).get(MySharedViawModel.class);
        setContentView(R.layout.activity_main);
        deviceBtn = (Button) findViewById(R.id.device_btn);

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



        deviceBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent ActivityDevice = new Intent (MainActivity.this, ActivityDevice.class);

                startActivityForResult(ActivityDevice, REQUEST_CODE1);
            }
        });



    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode==1){
            Bundle bundle = data.getExtras();
            mmDevice = (BluetoothDevice) bundle.get("MyDEVICE");

            mmConectThread = new ConnectThread(mmDevice,mHandler);
            mmConectThread.start();

        }
    }

    @Override
    protected void onResume() {
        super.onResume();


    }



    private ActivityResultLauncher<String> requestPermissionLauncher =
            registerForActivityResult(new ActivityResultContracts.RequestPermission(), isGranted -> {
                if (isGranted) {
                    Toast.makeText(MainActivity.this, "Localisation permission granted", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(MainActivity.this, "Localisation permission denied", Toast.LENGTH_LONG).show();
                }
            });

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mmConnectedThread.cancel();
    }
}