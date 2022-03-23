<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProdutoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nome' => 'required | max:20',
            'descricao' => 'required | max:500',
            'qtd_estoque' => 'required | numeric | min:1',
            'preco' => 'required | numeric | min:1.99',
            'importado' => 'nullable | boolean',
            'fornecedor_id' => 'required | exists:fornecedores,id'

        ];
    }

    public function messages()
    {
        return [
            'nome.required' => 'O nome do Produto e obrigatorio!',
            'nome.max' => 'O nome não pode passar de vinte caracteres!',
            'fornecedor_id.required' => 'O Fornecedor e obrigatorio!',
            'fornecedor_id.exists' => 'Este Fornecedor nao esta cadastrado!'

        ];
    }
}
