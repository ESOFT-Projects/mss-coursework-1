<?php

namespace App\Http\Resources;
use App\Http\Resources\Config;


class GCM
{
    function __construct()
    {
		new Config(); 
    }
 
    public function sendMessage($registration_ids, $message) {
        $fields = array(
            'registration_ids' => $registration_ids,
            'data' => $message,
        );
        return $this->sendPushNotification($fields);
    }
 
    private function sendPushNotification($fields){


        $headers = array(
            'Authorization: key=' . GCM_API_KEY,
            'Content-Type: application/json'
        );
 
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, GCM_SEND_URL);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
 
        $result = curl_exec($ch);
        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }
        curl_close($ch);
 
        return $result;
    }
}