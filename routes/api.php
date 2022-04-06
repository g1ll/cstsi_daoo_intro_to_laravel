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
        $user = $request->user();
        // $user = auth()->user();
        return [
            'isAdmin' => $user->tokenCan('is-admin'),
            'tokens' => $user->tokens,
            'currentToken'=>$user->currentAccessToken()->token
        ]; //usando helper auth() não necessida do Request
    }
);

Route::get('/produtos', [ProdutoController::class, 'index']);
Route::get('/produtos/{id}', [ProdutoController::class, 'show']);

//Todas as rotas neste grupo estão sujeitas a autenticação
Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::post('/produtos', [ProdutoController::class, 'store']);
    Route::put('/produtos/{id}', [ProdutoController::class, 'update']);
    Route::delete('/produtos/{id}', [ProdutoController::class, 'delete']);

    Route::apiResource('fornecedores', FornecedorController::class)
        ->parameters(["fornecedores" => "fornecedor"]);

    //Abilidade
    Route::put(
        'fornecedores/{fornecedor}',
        [FornecedorController::class, 'update']
    )->middleware(['ability:is-admin']);

    Route::get('fornecedores/{fornecedor}/produtos', [FornecedorController::class, 'listProdutos'])
        ->name('fornecedores.produtos');

    Route::apiResource('users', UserController::class);

    Route::get('logout', [LoginController::class, 'logout'])->name('logout');
});

Route::post('login', [LoginController::class, 'login'])->name('login');


//Se registrarmos rotas fora do grupo com o middleware sanctum, estas serão liberadas da autenticação
//Como exemplo, liberamos acesso aos métodos index e show de Fornecedores
Route::get('fornecedores', [FornecedorController::class, 'index']);
Route::get('fornecedores/{fornecedor}', [FornecedorController::class, 'show']);
