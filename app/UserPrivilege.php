<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPrivilege extends Model {
protected $table="users_privileges";
protected $primaryKey="privilege_id";
public $timestamps=false;
}
