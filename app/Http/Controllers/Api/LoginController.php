<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(LoginRequest $request)
    {
        try{
            $user = User::where('email',$request->email)->first();
            if(!$user || !Hash::check($request->password,$user->password))
                throw new Exception('Senha incorreta!!');
            
            $ability = $user->is_admin?['is-admin']:[];
            $token = $user->createToken($request->email,$ability)->plainTextToken;
            
            return response()->json(['token'=>$token]);
        }catch(Exception $error){
            return response()->json([
                'erro'=>$error->getMessage()
            ]);
        }
    }

    public function user()
    {
        return auth()->user();
    }

    public function logout(Request $request)
    {
        $auth_user = $request->user();
        if($request->input('all')){
            if($auth_user->tokens()->delete())
                return ['logout'=>'Desconectado de todos os dispositivos!'];
        }else{
            if($auth_user->currentAccesstoken()->delete())
                return ['logout'=>'Usuário desconectado!'];
        }
        return response()->json(['logout'=>'Falha ao desconectar Usuário!'],500);
    }
}
