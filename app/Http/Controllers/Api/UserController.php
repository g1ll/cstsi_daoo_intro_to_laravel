<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserRequest;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage  = $request->query('per_page');
        $usersPaginated = User::paginate($perPage);
        $usersPaginated->appends([
            'per_page'=>$perPage
        ]);
        return response()->json($usersPaginated);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserRequest $request)
    {
        $status = 200;
        try{
            $newUser = $request->post();
            if(!$newUser){
                $status = 400;
                throw new Exception('Os dados devem ser enviados via POST!!');
            }
            $newUser['password'] = password_hash(
                $newUser['password'],
                PASSWORD_DEFAULT);
            $response = [
                'mensagem'=>'Usuário cadastrado com sucesso!!',
                'user'=>User::create($newUser)
            ];
        }catch(Exception $error){
            $status = isset($error->errorInfo)?500:$status;
            $response = [
                'error'=>isset($error->errorInfo)?
                    'Erro interno com o Banco de Dados!!'
                    :$error->getMessage()
          ];
        }
        return response()->json($response,$status);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return $user;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
