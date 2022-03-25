<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        $this->renderable(function (NotFoundHttpException $e) {
            $message = $e->getMessage(); //Mensagem da exceção
            //Gambiarra para pegar o Modelo e o ID pela mensagem da exceção ! :(
            $model = explode(']',explode('\\',$message)[2])[0]; //Pegou o nome do Model
            $id = trim(explode(']',explode('\\',$message)[2])[1]);//Pegou o id não encontrado
            return response()->json([
                            'Erro'=>"$model com o ID:$id  não encontrado!", //Minha mensagem personalizada
                            'Mensagem'=>$e->getMessage() //Mensagem da Exceção
                        ],404);   
        });

    }
}
