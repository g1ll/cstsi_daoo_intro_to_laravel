<?php

namespace Database\Factories;

use App\Models\Produto;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Produto>
 */
class ProdutoFactory extends Factory
{
    protected $model = Produto::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'nome'=>$this->faker->word(),
            'descricao'=>$this->faker->paragraph(4),
            'qtd_estoque'=>$this->faker->randomNumber(5),
            'preco'=>$this->faker->randomFloat(2,100,15000),
            'importado'=>$this->faker->boolean()
        ];
    }
}
