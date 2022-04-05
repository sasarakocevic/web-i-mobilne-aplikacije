<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([
    'middleware' => 'api'
], function ($router) {

    //DRZAVA
    Route::get('drzava', [\App\Http\Controllers\DrzavaController::class, 'index']);
    Route::get('drzava/{id}', [\App\Http\Controllers\DrzavaController::class, 'show']);
    Route::post('drzava', [\App\Http\Controllers\DrzavaController::class, 'store']);
    Route::put('drzava/{id}', [\App\Http\Controllers\DrzavaController::class, 'update']);
    Route::delete('drzava/{id}', [\App\Http\Controllers\DrzavaController::class, 'destroy']);

    //GOST
    Route::get('gost', [\App\Http\Controllers\GostController::class, 'index']);
    Route::get('gost/{id}', [\App\Http\Controllers\GostController::class, 'show']);
    Route::post('gost', [\App\Http\Controllers\GostController::class, 'store']);
});
