<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Categoria;
//use Illuminate\Support\Facades\DB;

class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     //solo acceso mediante peticiones ajax para eso es ifff seguridad
    // if (!$request->ajax()) return redirect('/');
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
 
        $buscar = $request->buscar;
        $criterio = $request->criterio;
         
        if ($buscar==''){
            $categorias = Categoria::orderBy('id', 'desc')->paginate(5);
        }
        else{
            $categorias = Categoria::where($criterio, 'like', '%'. $buscar . '%')->orderBy('id', 'desc')->paginate(5);
        }
         
 
        return [
            'pagination' => [
                'total'        => $categorias->total(),
                'current_page' => $categorias->currentPage(),
                'per_page'     => $categorias->perPage(),
                'last_page'    => $categorias->lastPage(),
                'from'         => $categorias->firstItem(),
                'to'           => $categorias->lastItem(),
            ],
            'categorias' => $categorias
        ];
    }

    public function selectCategoria(Request $request){
        if(!$request->ajax()) return redirect('/');
        $categorias = Categoria::where('condicion','=','1')
        ->select('id','nombre')->orderBy('nombre','asc')->get();
        return['categorias'=>$categorias];
    } 

    public function store(Request $request)
    {
        //esta funcion es almacenar
        if (!$request->ajax()) return redirect('/');
        $categoria = New Categoria();
        $categoria->nombre =$request->nombre;
        $categoria->descripcion=$request->descripcion;
        $categoria->condicion=1;
        $categoria->save();
    }



    public function update(Request $request)
    {   
        //editar campos
        if (!$request->ajax()) return redirect('/');
        $categoria =  Categoria::findOrFail($request->id);
        $categoria->nombre =$request->nombre;
        $categoria->descripcion=$request->descripcion;
        $categoria->condicion='1';
        $categoria->save();
    }

    public function desactivar(Request $request)
    {
        //desactiva
        if (!$request->ajax()) return redirect('/');
        $categoria =  Categoria::findOrFail($request->id);
        $categoria->condicion='0';
        $categoria->save();
    }
    public function activar(Request $request)
    {
        //activa
        if (!$request->ajax()) return redirect('/');
        $categoria =  Categoria::findOrFail($request->id);
        $categoria->condicion='1';
        $categoria->save();
    }
}
