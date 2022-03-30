<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
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
            $token = $user->createToken($request->email)->plainTextToken;
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
}
