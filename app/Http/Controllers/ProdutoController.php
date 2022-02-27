<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{

    private $produto;

    public function __construct()
    {
        $this->produto = new Produto();
    }

    public function index(){
        // return response()->json($this->produto->all());
        return view('produtos',['produtos'=>$this->produto->all()]);
    }

    public function show($id)
    {
        return view('produto',[
            'produto'=>$this->produto->find($id)
        ]);
    }
}
