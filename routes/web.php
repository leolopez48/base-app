<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\ExcelController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\ViewsController;

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



Auth::routes(['verify' => true, 'remember_me'=>false, 'register' => false]);

Route::group(['middleware'=> ['auth', 'verified', 'log', 'throttle:web']], function () {
    // Apis
    Route::resource('/api/web/user', UserController::class);
    Route::resource('/api/web/role', RoleController::class);
    Route::resource('/api/web/permission', PermissionController::class);
    Route::post('/api/web/user/search', [UserController::class, 'search']);
    Route::post('/api/web/user/block', [UserController::class, 'block']);

    // Views
    Route::get('/', [ViewsController::class, 'home']);
    Route::get('/home', [ViewsController::class, 'home']);
    Route::get('/role', [ViewsController::class, 'role']);
    Route::get('/user', [ViewsController::class, 'user']);
});
