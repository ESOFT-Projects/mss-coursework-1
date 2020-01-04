<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Page;



Route::get('/', function () {
    return view('welcome');
});

Auth::routes();


$pages = Page::where('route','web')->get();
foreach($pages as $page){	
	$method = $page->method;
	$url = $page->url;			
	$controller = $page->controller;			
	$function = $page->function;	
	Route::$method($url, "$controller@$function")->name($function);
}
 