<?php

namespace App\Http\Controllers;

use App\Models\Produto;

class ProdutoController extends Controller
{

    public function index(){
        return view('produtos',['produtos'=>Produto::all()]);
    }

}
