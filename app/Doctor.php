<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Doctor extends Model {
    protected $table="doctors";
    protected $primaryKey="doctor_id";
    public $timestamps=false;

    public function employee()
    {
        return $this->belongsTo('App\Employee', 'employee_id', 'employee_id');
    }
    public function charges()
    {
        return $this->hasMany('App\DoctorCharge', 'doctor_id', 'doctor_id');
    }
    public function patients()
    {
        return $this->hasManyThrough('App\Patient', 'App\PatientHistory', 'doctor_id', 'patient_id', 'doctor_id', 'id');
    }
    public function appointments()
    {
        return $this->hasmany('App\Appointment', 'doctor_id', 'doctor_id');
    }
    public function invoices()
    {
        return $this->hasManyThrough('App\AppointmentInvoice', 'App\Appointment', 'doctor_id', 'appointment_id', 'doctor_id', 'id');
    }
    public function paidInvoices()
    {
        return $this->invoices()->whereNotNull('paid_at')->get();
    }
    public function unpaidInvoices()
    {
        return $this->invoices()->whereNull('paid_at')->get();
    }
}
