package com.example.carbonfire.controller;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothServerSocket;
import android.bluetooth.BluetoothSocket;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;

import java.io.IOException;
import java.util.UUID;

import static android.icu.lang.UProperty.NAME;

public class ConnectThread extends Thread implements Runnable {
    private BluetoothSocket mmSocket = null;
    private final BluetoothDevice mmDevice;
    private UUID MY_UUID = UUID.fromString("00001101-0000-1000-8000-00805f9b34fb");
    BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    Handler mmhandler;

    public ConnectThread(BluetoothDevice device, Handler handler) {
        // Use a temporary object that is later assigned to mmSocket
        // because mmSocket is final.
        BluetoothSocket tmp = null;
        mmDevice = device;
        mmhandler = handler;

        try {
            // Get a BluetoothSocket to connect with the given BluetoothDevice.
            // MY_UUID is the app's UUID string, also used in the server code.
            tmp = device.createRfcommSocketToServiceRecord(MY_UUID);
        } catch (IOException e) {
            Message msg = mmhandler.obtainMessage();
            msg.arg1=2;
            mmhandler.sendMessage(msg);
        }
        mmSocket = tmp;

    }

    public void run() {
        // Cancel discovery because it otherwise slows down the connection.
        bluetoothAdapter.cancelDiscovery();

        try {
            // Connect to the remote device through the socket. This call blocks
            // until it succeeds or throws an exception.
            mmSocket.connect();
            Message msg = mmhandler.obtainMessage();
            msg.obj= new String("connecté à "+mmDevice.getName());
            msg.arg1=0;
            mmhandler.sendMessage(msg);



        } catch (IOException connectException) {
            // Unable to connect; close the socket and return.
            Message msg = mmhandler.obtainMessage();
            msg.arg1=2;
            mmhandler.sendMessage(msg);
            try {
                mmSocket.close();
            } catch (IOException closeException) {
               // Log.e(TAG, "Could not close the client socket", closeException);
            }
            return;
        }

    }

    public BluetoothSocket GetSocket(){
        return mmSocket;
    }

    // Closes the client socket and causes the thread to finish.
    public void cancel() {
        try {
            mmSocket.close();
        } catch (IOException e) {
            //Log.e(TAG, "Could not close the client socket", e);
        }
    }
}
