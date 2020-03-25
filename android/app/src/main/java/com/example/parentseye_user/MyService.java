package com.arkinindia.lets_auction;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

public class MyService extends FirebaseMessagingService {

    public static final int NOTIFICATION_ID = 1;
    public static final String CALL_BY = "notification";
    private NotificationManager mNotificationManager;
    private static final String TAG = "FCMMessagingService";
    private String typeId;

    @Override
    public void onMessageReceived(@NonNull RemoteMessage remoteMessage) {
        super.onMessageReceived(remoteMessage);

        Log.d(TAG, remoteMessage.getData().toString());
        mNotificationManager = (NotificationManager) this.getSystemService(Context.NOTIFICATION_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel("channelId",
                    "Channel id 1",
                    NotificationManager.IMPORTANCE_DEFAULT);
            mNotificationManager.createNotificationChannel(channel);
        }
      //  sendNotification(remoteMessage);

    }

    /*private void sendNotification(RemoteMessage remoteMessage) {

       *//* Intent intent = new Intent(this, UserWizBidsActivity.class);
        intent.putExtra("Pid",remoteMessage.getData().get("ad_id"));*//*
        if (remoteMessage.getData().get("header").equals("bid_notification_realestate"))
        {
            intent.putExtra("type","Real Estate");
        }
        else if(remoteMessage.getData().get("header").equals("bid_notification_vehicles"))
        {
            intent.putExtra("type","Vehicles");
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent,
                PendingIntent.FLAG_ONE_SHOT);

        Uri defaultSoundUri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
        NotificationCompat.Builder notificationBuilder =
                new NotificationCompat.Builder(this, "channelId")
                        .setSmallIcon(R.drawable.ic_launcher)
                        .setContentTitle(remoteMessage.getData().get("title"))
                        .setContentText(remoteMessage.getData().get("body"))
                        .setAutoCancel(true)
                        .setSound(defaultSoundUri)
                        .setStyle(new NotificationCompat.BigTextStyle().bigText(remoteMessage.getData().get("body")))
                        .setContentIntent(pendingIntent);
        mNotificationManager.notify(0, notificationBuilder.build());

    }*/

    @Override
    public void onNewToken(@NonNull String token) {
        super.onNewToken(token);
        Log.d("TokenRefresh", "Refreshed token: " + token);
    }
}
