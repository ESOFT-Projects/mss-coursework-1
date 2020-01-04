<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HospitalChargeType extends Model
{
    protected $guarded = [];
    protected $table = 'hospital_charge_types';

    public function charges()
    {
        return $this->hasMany('App\HospitalCharges', 'charge_type_id', 'id');
    }
}
