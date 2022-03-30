<?php

use App\Http\Controllers\Api\FornecedorController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\ProdutoController;
use App\Http\Controllers\Api\UserController;
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

Route::middleware('auth:sanctum')->get(
    '/user',
    function () {
        return auth()->user();
    }
);


Route::get('/produtos', [ProdutoController::class, 'index']);
Route::get('/produtos/{id}', [ProdutoController::class, 'show']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/produtos', [ProdutoController::class, 'store']);

    Route::put('/produtos/{id}', [ProdutoController::class, 'update']);

    Route::delete('/produtos/{id}', [ProdutoController::class, 'delete']);

    Route::apiResource('fornecedores', FornecedorController::class)
        ->parameters(["fornecedores" => "fornecedor"]);

    Route::get('fornecedores/{fornecedor}/produtos', [FornecedorController::class, 'listProdutos'])
        ->name('fornecedores.produtos');

    Route::apiResource('users', UserController::class);
});

Route::post('login', [LoginController::class, 'login'])->name('login');
