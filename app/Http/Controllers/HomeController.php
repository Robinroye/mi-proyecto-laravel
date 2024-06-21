<?php
/* Controllers */
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        return view('index'); 
    }
    public function variedades()
    {
        return view('variedades'); 
    }
    public function giros()
    {
        return view('giros'); 
    }
    public function tramites()
    {
        return view('tramites'); 
    }
    public function carrito()
    {
        return view('carrito'); 
    }
    public function encuentranos()
    {
        return view('encuentranos'); 
    }
    public function contacto()
    {
        return view('contacto'); 
    }

}
