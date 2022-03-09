<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produto;
use Exception;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    public function index()
    {
        return response()->json(Produto::all());
    }

    public function show($id)
    {   
        try{
            return response()->json(Produto::findOrFail($id));
        }catch(Exception $error){
            $messageError = [
                'Erro'=>"O produto não encontrado com id:$id!",
                'Exception'=>$error->getMessage()
                // 'Trace'=>$error->getTrace()
            ];
            $statusHttp=404;
            return response($messageError, $statusHttp);
        }
    }

    public function store(Request $request)
    {
        try{
            $newProduto = $request->post();
            $newProduto['importado']=($request->importado)?true:false;
            $storedProtudo = Produto::create($newProduto);
            return response()->json([
                'message'=>'Produto criado com sucesso!',
                'produto' => $storedProtudo
            ]);
        }catch(Exception $error){
            $messageError = [
                'Erro'=>"Erro ao inserir o novo Produto!",
                'Exception'=>$error->getMessage()
                // 'Trace'=>$error->getTrace()
            ];
            $statusHttp=500;
            return response($messageError, $statusHttp);
        }
    }
}
