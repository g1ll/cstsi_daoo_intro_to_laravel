<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produtos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('fornecedor_id')
                ->references('id')->on('fornecedores')
                // ->constrained('fornecedores')
                ->cascadeOnDelete();
            $table->text('nome');
            $table->text('descricao');
            $table->integer('qtd_estoque');
            $table->float('preco');
            $table->boolean('importado')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('produtos');
    }
};
