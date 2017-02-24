<?php

// Apply middleware to all routes
Route::group(['middleware' => 'camo.web'], function () {

	// Default homepage
	Route::get('/', function () {
		$services = App\Service::listing()->get();

    return Layout::nest('home.index', [
			'services' => $services,
		]);
	});

});
