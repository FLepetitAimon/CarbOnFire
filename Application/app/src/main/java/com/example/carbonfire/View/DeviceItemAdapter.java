package com.example.carbonfire.View;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.example.carbonfire.R;

import java.util.List;

public class DeviceItemAdapter extends BaseAdapter {

    //fields
    private Context context;
    private List<BluetoothDevice> listBtDevice;
    private LayoutInflater inflater;

    //constructor
    public DeviceItemAdapter(Context context, List<BluetoothDevice> listBtDevice){
        this.context = context;
        this.listBtDevice = listBtDevice;
        this.inflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return listBtDevice.size();
    }

    @Override
    public BluetoothDevice getItem(int position) {
        return listBtDevice.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        convertView = inflater.inflate(R.layout.adapter_device_item, null);

        //get information about item
        BluetoothDevice currentDevice = getItem(position);
        String DeviceName = currentDevice.getName();
        String DeviceMac = currentDevice.getAddress();

        //get device name view
        TextView deviceNameView = convertView.findViewById(R.id.device_name);
        deviceNameView.setText(DeviceName);

        //get device Mac view
        TextView deviceMacView = convertView.findViewById(R.id.device_mac);
        deviceMacView.setText(DeviceMac);

        return convertView;
    }
}
