<?php

use App\Http\Controllers\FornecedorController;
use  App\Http\Controllers\ProdutoController;
use App\Http\Controllers\HomeController;
use App\Models\Produto;
use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


// Route::get('/ola',function(){
//     echo "<h2>Olá Mundo com Laravel!!</h2>";
// });

Route::get('/ola',[HomeController::class,'index']);
Route::get('/produtos',[ProdutoController::class,'index'])->name('index');
Route::get('/produto/{id}',[ProdutoController::class,'show'])->name('show');

//Create
Route::get('/produto',[ProdutoController::class,'create']);
Route::post('/produto',[ProdutoController::class,'store']);

// Update
Route::get('/produto/{id}/edit',[ProdutoController::class,'edit'])->name('edit');
Route::post('/produto/{id}/update',[ProdutoController::class,'update'])->name('update');

// Route::get('/produto/{id}/edit',function($id){
//     return view('produto_edit',['produto'=>Produto::find($id)]);
// })->name('edit');

//Delete
Route::get('/produto/{id}/delete',[ProdutoController::class,'delete'])->name('delete');
Route::post('/produto/{id}/remove',[ProdutoController::class,'remove'])->name('removeProduto');

//Route::resource('fornecedores',FornecedorController::class);
