<?php

//use Illuminate\Support\Facades\Route;

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
Route::group(['middleware'=>['guest']],function(){

    Route::get('/','Auth\LoginController@showLoginForm');

    Route::post('/login', 'Auth\LoginController@login')->name('login');

   Route::get('/login','Auth\LoginController@showLoginForm');

});
/*Route::group(['middleware'=>['guest']],function(){
    Route::get('/','Auth\LoginController@showLoginForm');
    Route::post('/login','Auth\loginController@login')->name('login');
});*/

Route::group(['middleware'=>['auth']],function(){

    Route::post('/logout','Auth\LoginController@logout')->name('logout');
    
    Route::get('/main', function () {
        return view('contenido/contenido');
    })->name('main');

    Route::group(['middleware'=>['administrador']],function(){
        Route::get('/categoria', 'CategoriaController@index');
        Route::post('/categoria/registrar', 'CategoriaController@store');
        Route::put('/categoria/actualizar', 'CategoriaController@update');
        Route::put('/categoria/desactivar', 'CategoriaController@desactivar');
        Route::put('/categoria/activar', 'CategoriaController@activar');
        Route::get('/categoria/selectCategoria', 'CategoriaController@selectCategoria');
 
        Route::get('/articulo', 'ArticulosController@index');
        Route::post('/articulo/registrar', 'ArticulosController@store');
        Route::put('/articulo/actualizar', 'ArticulosController@update');
        Route::put('/articulo/desactivar', 'ArticulosController@desactivar');
        Route::put('/articulo/activar', 'ArticulosController@activar');
 
        Route::get('/proveedor', 'ProveedorController@index');
        Route::post('/proveedor/registrar', 'ProveedorController@store');
        Route::put('/proveedor/actualizar', 'ProveedorController@update');

        Route::get('/ingreso', 'IngresoController@index');
        Route::post('/ingreso/registrar', 'IngresoController@store');
        Route::put('/ingreso/desactivar', 'IngresoController@desactivar');
        Route::get('/ingreso/obtenerCabecera', 'IngresoController@obtenerCabecera');
        Route::get('/ingreso/obtenerDetalles', 'IngresoController@obtenerDetalles');
         
        Route::get('/cliente', 'ClienteController@index');
        Route::post('/cliente/registrar', 'ClienteController@store');
        Route::put('/cliente/actualizar', 'ClienteController@update');
 
        Route::get('/rol', 'RolController@index');
        Route::get('/rol/selectRol', 'RolController@selectRol');
         
        Route::get('/user', 'UserController@index');
        Route::post('/user/registrar', 'UserController@store');
        Route::put('/user/actualizar', 'UserController@update');
        Route::put('/user/desactivar', 'UserController@desactivar');
        Route::put('/user/activar', 'UserController@activar');

    });

    Route::group(['middleware'=>['control']],function(){
        Route::get('/persona', 'PersonaController@index');
        Route::post('/persona/registrar', 'PersonaController@store');
        Route::put('/persona/actualizar', 'PersonaController@update');
        Route::put('/persona/desactivar', 'PersonaController@desactivar');
        Route::put('/persona/activar', 'PersonaController@activar');
        Route::get('/persona/selectpersona', 'PersonaController@index');                

    });
    
});




