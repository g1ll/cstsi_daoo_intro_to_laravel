<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Fornecedor;
use Exception;
use Illuminate\Http\Request;

class FornecedorController extends Controller
{

    private $fornecedor;

    public function __construct(Fornecedor $fornecedor)
    {
        $this->fornecedor = $fornecedor;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->fornecedor->all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
            return response()->json([
                "Message"=>"Fornecedor inserido com sucesso!",
                "Fornecedor"=>$this->fornecedor->create($request->post())
            ]);
        }catch(Exception $error){
            return response()->json([
                "Erro"=>"Não foi possível criar novo Fornecedor!",
                "Exception"=>$error->getMessage()
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Fornecedor  $fornecedor
     * @return \Illuminate\Http\Response
     */
    public function show(Fornecedor $fornecedor)
    {
        try {
            if($fornecedor)
                return $fornecedor;
        }catch(Exception $error){
            return response()->json([
                "Message"=>"Fornecedor não encontrado!",
                "Erro"=> $error->getMessage()
            ],404);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Fornecedor  $fornecedor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Fornecedor $fornecedor)
    {
        try{
            $fornecedor->update($request->all());
            return response()->json([
                "Message"=>"Fornecedor atualizado com sucesso!",
                "Fornecedor"=>$fornecedor
            ]);
        }catch(Exception $error){
            return response()->json([
                "Erro"=>"Não foi possível atualizar o Fornecedor!",
                "Exception"=>$error->getMessage()
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Fornecedor  $fornecedor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Fornecedor $fornecedor)
    {
        try{
            if($fornecedor->delete())
                return response()->json([
                    "Messge"=>"Fornecedor removido !",
                    "Fornecedor"=>$fornecedor
                ]);
            throw new Exception("Erro ao deletar Fornecedor!");
        }catch(Exception $error){
            return response()->json([
                "Erro"=>"Não foi possível remover o Fornecedor!",
                "Exception"=>$error->getMessage()
            ]);
        }
    }

    public function listProdutos(Fornecedor $fornecedor)
    {
        return response()->json($fornecedor->load('produtos'));
    }
}
