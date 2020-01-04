<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model {
protected $table="products_categories";
protected $primaryKey="category_id";
public $timestamps=false;
protected $fillable = ['title'];
}
