<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TimeSlot extends Model
{
    protected $guarded = [];
    public $timestamps = false;

    public function appointments()
    {
        return $this->hasMany('App\Appointment', 'time_slot_id', 'id');
    }
}
