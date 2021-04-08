<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClassificacaoController;
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

// Rota Inicial, Lista a classificação do campeonato Brasileiro
Route::get('/',[ClassificacaoController::class,'getClassificacao']);

// Inclui um resultado de uma partida
Route::post('/incluirResultado',[ClassificacaoController::class,'incluirResultado']);
