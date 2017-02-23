<?php

// Apply middleware to all routes
Route::group(['middleware' => 'camo.web'], function () {

	// Default homepage
	Route::get('/', function () {
    return Layout::nest('home.index');
	});

});
