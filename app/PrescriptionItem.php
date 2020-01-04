<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PrescriptionItem extends Model
{
    protected $table = 'prescription_items';
	
	protected $guarded =[];
	
	public $timestamps=false;

    public function prescription()
    {
        return $this->belongsTo('App\Prescription', 'prescription_id', 'id');
    }
}
