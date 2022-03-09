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
        try {
            return response()->json(Produto::findOrFail($id));
        } catch (Exception $error) {
            $message = "O produto não encontrado com id:$id!";
            return $this->errorMessage($error, $message, 404);
        }
    }

    public function store(Request $request)
    {
        try {
            $newProduto = $request->post();
            $newProduto['importado'] = ($request->importado) ? true : false;
            $storedProtudo = Produto::create($newProduto);
            return response()->json([
                'message' => 'Produto criado com sucesso!',
                'produto' => $storedProtudo
            ]);
        } catch (Exception $error) {
            $message = 'Erro ao inserir o novo Produto!';
            return $this->errorMessage($error, $message, 500, true);
        }
    }

    private function errorMessage($error, $message, $statusHttp, $trace = false)
    {
        $messageError = [
            'Erro' => $message,
            'Exception' => $error->getMessage()
        ];
        $trace && $messageError['Trace'] = $error->getTrace();
        return response($messageError, $statusHttp);
    }
}
