<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index(){
        echo "<h1>Olá Mundo!!! Eu sou um Controller!!</h1>";
    }
}
