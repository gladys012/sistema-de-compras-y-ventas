<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Persona;

class PersonaController extends Controller
{
    public function index(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');

            $personas = Persona::select('personas.nombre','personas.nro_documento','personas.email',
                                        'personas.telefono','personas.direccion','personas.id')
            ->orderBy('personas.id', 'desc')->paginate(1000);        

        return [
            'personas' => $personas
        ];
    }
    public function selectpersonas(Request $request){
        if(!$request->ajax()) return redirect('/');
        $personas = Persona::where('estado','=','1')
        ->select('id','codigo_lab')->orderBy('codigo_lab','asc')->get();
        return['personas'=>$personas];
    } 
    public function selectPersonaCarnet(Request $request){
        // if(!$request->ajax()) return redirect('/');
         
         $filtro = $request->filtro; 
         $identificador = Persona::where('estado','=','1')
         ->orWhere('identificador.paterno','like','%'. $filtro . '%')
         ->orWhere('identificador.ci','like','%'. $filtro . '%')
         ->select('identificador.id','identificador.ci','identificador.nombre','identificador.paterno','identificador.materno')//,'identificador.nro_entrega')
         ->orderBy('identificador.paterno','asc')->get();
         return['identificador'=>$identificador];
     }
     public function selectPersona(Request $request){
        // if(!$request->ajax()) return redirect('/');
         
         $filtro = (str_replace(" ", "", $request))->filtro;   //$request->filtro;
         $identificador = Persona::where('estado','=','1')
         //->where('identificador.patern|8¿|||||','like','%'. $filtro . '%')
         //->orWhere('personas.ci','like','%'. $filtro . '%')
         ->orWhereRaw('(personas.nombre || personas.nombre || personas.nombre) LIKE ? ', '%' . $filtro. '%') 
         ->select('personas.id','personas.ci','personas.nombre','personas.paterno','personas.materno')
         ->orderBy('personas.paterno','asc')->get();
         return['personas'=>$personas];
     }
    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $personas = new Persona();
        $personas->nombre = $request->nombre;
        $personas->paterno = $request->paterno;
        $personas->materno = $request->materno;
        $personas->ci = $request->ci;
        $personas->telefono = $request->telefono;
        $personas->email = $request->email;
        $personas->direccion = $request->direccion;
        $personas->usr_id = $request->usr_id;
        $personas->estado = '1';
        $personas->save();
    }
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $personas = Persona::findOrFail($request->id);
        $personas->nombre = $request->nombre;
        $personas->paterno = $request->paterno;
        $personas->materno = $request->materno;
        $personas->ci = $request->ci;
        $personas->telefono = $request->telefono;
        $personas->email = $request->email;
        $personas->direccion = $request->direccion;
        $personas->usr_id = $request->usr_id;
        $personas->estado = '1';
        $personas->save();
    }
 
    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $personas = Persona::findOrFail($request->id);
        $personas->estado = '0';
        $personas->save();
    }
 
    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $personas = Persona::findOrFail($request->id);
        $personas->estado = '1';
        $personas->save();
    }
 
}