<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductBrand extends Model {
protected $table="products_brands";
protected $primaryKey="brand_id";
public $timestamps=false;
protected $fillable = ['title'];
}
