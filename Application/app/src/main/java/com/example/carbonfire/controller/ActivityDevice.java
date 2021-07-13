package com.example.carbonfire.controller;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProvider;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.carbonfire.R;
import com.example.carbonfire.View.DeviceItemAdapter;
import com.example.carbonfire.model.MySharedViawModel;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static android.content.ContentValues.TAG;

public class ActivityDevice extends AppCompatActivity {

    // fields
    ListView listViewBtDevice;
    List<BluetoothDevice> listBtDevice = new ArrayList<>();
    private  BluetoothDevice mmDevice;
    BluetoothAdapter bluetoothAdapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_device);

        setResult(0);


        listViewBtDevice = (ListView) findViewById(R.id.DeviceList_id);
        listViewBtDevice.setAdapter(new DeviceItemAdapter(this, listBtDevice));

        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothAdapter == null) {
            Toast.makeText(ActivityDevice.this, "Bluetooth is not supported on this device", Toast.LENGTH_LONG).show();
        }

        if (!bluetoothAdapter.isEnabled()) {
            Intent BtDiscoveryActivity = new Intent (BluetoothAdapter.ACTION_REQUEST_ENABLE);
            BtDiscoveryActivityResultLauncher.launch(BtDiscoveryActivity);
        }





        else {

            if (bluetoothAdapter.startDiscovery())
                Toast.makeText(ActivityDevice.this, "searching for device", Toast.LENGTH_SHORT).show();
            else
                Toast.makeText(ActivityDevice.this, "Bluetooth device research failed", Toast.LENGTH_SHORT).show();


            IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_FOUND);
            registerReceiver(receiver, filter);
        }

        listViewBtDevice.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                mmDevice = listBtDevice.get(position);
                Intent intent = new Intent();
                intent.putExtra("MyDEVICE", mmDevice);
                intent.setAction("CONNECTION_DEVICE");
                setResult(1,intent);
                finish();
            }

        });

    }

    ActivityResultLauncher<Intent> BtDiscoveryActivityResultLauncher = registerForActivityResult(
            new ActivityResultContracts.StartActivityForResult(),
            new ActivityResultCallback<ActivityResult>() {
                @Override
                public void onActivityResult(ActivityResult result) {
                    if (result.getResultCode() == RESULT_OK) {
                        // There are no request codes

                            if (bluetoothAdapter.startDiscovery())
                                Toast.makeText(ActivityDevice.this, "searching for device now", Toast.LENGTH_LONG).show();
                            else
                                Toast.makeText(ActivityDevice.this, "Bluetooth device research failed", Toast.LENGTH_LONG).show();

                        IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_FOUND);
                        registerReceiver(receiver, filter);
                    }

                }



            });


    // Create a BroadcastReceiver for ACTION_FOUND.
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                listBtDevice.add(device);
                listViewBtDevice.setAdapter(new DeviceItemAdapter(ActivityDevice.this, listBtDevice));

            }
        }


    };

    @Override
    protected void onDestroy() {
        super.onDestroy();
        bluetoothAdapter.cancelDiscovery();
        unregisterReceiver(receiver);
    }

}