package com.example.carbonfire.model;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Handler;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class MySharedViawModel extends ViewModel {
    public MutableLiveData<BluetoothDevice> mmDevice;
    public MutableLiveData<BluetoothSocket> mmSocket;
    public MutableLiveData<Handler> mmHandler;

    public BluetoothDevice getMmDevice() {
        return mmDevice.getValue();
    }

    public void setMmDevice(BluetoothDevice device) {
        mmDevice.setValue(device);
    }


    public BluetoothSocket getMmSocket() {
        return mmSocket.getValue();
    }

    public void setMmSocket(BluetoothSocket socket) {
        mmSocket.setValue(socket);
    }


    public Handler getMmHandler(){
        return mmHandler.getValue();
    }

    public void setMmhandler(Handler handler) {
        mmHandler.setValue(handler);
    }
}

