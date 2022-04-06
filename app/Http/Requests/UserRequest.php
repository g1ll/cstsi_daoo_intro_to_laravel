<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
            'name'      => 'required | string | max:50',
            'email'     => 'required | email | unique:users',
            'password'  => 'required | min:8',
            'is_admin'  => 'nullable | boolean'
        ];
    }

    public function messages()
    {
        return [
            'name.require'      => 'O nome é obrigatório!!',
            'email.require'     => 'O email é obrigatório!!',
            'password.require'  => 'A senha é obrigatória!!',
            'is_admin.boolean'  => 'O campo is_admin deverá ser 0 ou 1!'
        ];
    }
}
