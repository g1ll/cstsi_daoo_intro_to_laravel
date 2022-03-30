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
    function (Request $request) {
        //$request->user()
        return auth()->user(); //usando helper auth() não necessida do Request
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

//Se registrarmos rotas fora do grupo, estas serão liberadas da autenticação
//Aqui como exemplo liberamos acesso ao métodos index e show de Fornecedores
Route::get('fornecedores',[FornecedorController::class,'index']);
Route::get('fornecedores/{fornecedor}',[FornecedorController::class,'show']);
