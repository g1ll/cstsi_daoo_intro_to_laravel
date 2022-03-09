<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{

    public function index()
    {
        return view('produtos', ['produtos' => Produto::all()]);
    }


    public function show($id)
    {
        return view('produto', ['produto' => Produto::find($id)]);
    }


    public function create()
    {
        return view('produto_create');
    }

    public function store(Request $request)
    {
        $newProduto = $request->all();
        $newProduto['importado'] = ($request->importado) ? true : false;
        if (Produto::create($newProduto))
            return redirect('/produtos');
        else dd('Erro ao cadastrar produto');
    }

    public function edit($id)
    {
        return view('produto_edit', [
            'produto' => Produto::find($id)
        ]);
    }

    public function update(Request $request, $id)
    {
        $updProd = $request->all();
        $updProd['importado'] = ($request->importado) ? true : false;
        if (Produto::find($id)->update($updProd))
            return redirect('/produtos');
        else dd('Erro ao atualizar');
    }

    public function delete($id)
    {
        return view('produto_remove', [
            'produto' => Produto::find($id)
        ]);
    }

    public function remove(Request $request, $id)
    {
        if ($request->confirmar === 'Deletar')
            if (!Produto::destroy($id))
                dd("Erro ao deletar produto $id!");

        return redirect('/produtos');
    }
}
