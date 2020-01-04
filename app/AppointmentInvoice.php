<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AppointmentInvoice extends Model
{
    protected $guarded = [];

    public function appointment()
    {
        return $this->belongsTo('App\Appointment', 'appointment_id', id);
    }
}
