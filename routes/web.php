<?php
/* Route */
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

route::controller(HomeController::class)->group(function(){
    Route::get('index','index')->name('index');
    Route::get('encuentranos', 'encuentranos')->name('encuentranos');
    Route::get('contacto', 'contacto')->name('contacto');
    Route::get('carrito', 'carrito')->name('carrito');
    Route::get('tramites', 'tramites')->name('tramites');
    Route::get('giros', 'giros')->name('giros');
    Route::get('variedades', 'variedades')->name('variedades');
});

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
