<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model {
protected $table="products";
protected $primaryKey="product_id";
public $timestamps=false;

protected $fillable = ['category_id', 'brand_id', 'units', 'title', 'model', 'price'];

}
