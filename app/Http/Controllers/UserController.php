<?php
 
namespace App\Http\Controllers;
use App\User;
use App\Persona;
use Illuminate\Support\Facades\DB;
 
use Illuminate\Http\Request;
 
class UserController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
 
            $persona = User::join('persona','users.id','=','persona.id')
            ->join('roles','users.idrol','=','roles.id')
            ->select('persona.id','persona.nombre','persona.paterno','persona.materno',
            'persona.ci','persona.direccion', 'persona.departamento',
            'users.usuario','users.password',
            'users.condicion','users.idrol','roles.nombre as rol')
            ->orderBy('persona.id', 'desc')->paginate(10);
        
           return [ 'persona' => $persona
        ];
    }
 
    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
         
        try{
            DB::beginTransaction();
            $persona = new Persona();
            $persona->nombre = $request->nombre;
            $persona->paterno = $request->paterno;
            $persona->materno = $request->materno;
            $persona->ci = $request->ci;
            $persona->direccion = $request->direccion;
            $persona->departamento = $request->departamento;
            $persona->usr_id = 1;
            $persona->save();
 
            $user = new User();
            $user->usuario = $request->usuario;
            $user->password = bcrypt( $request->password);
            $user->condicion = '1';
            $user->idrol = $request->idrol;          
 
            $user->id = $persona->id;
 
            $user->save();
 
            DB::commit();
 
        } catch (Exception $e){
            DB::rollBack();
        }
 
         
         
    }
 
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
         
        try{
            DB::beginTransaction();
 
            //Buscar primero el proveedor a modificar
            $user = User::findOrFail($request->id);
 
            $persona = Persona::findOrFail($user->id);
 
            $persona->nombre = $request->nombre;
            $persona->paterno = $request->paterno;
            $persona->materno = $request->materno;
            $persona->ci = $request->ci;
            $persona->direccion = $request->direccion;
            $persona->telefono = $request->telefono;
            $persona->email = $request->email;
            $persona->usr_id = 1;
            $persona->save();
 
             
            $user->usuario = $request->usuario;
            $user->password = bcrypt( $request->password);
            $user->condicion = '1';
            $user->idrol = $request->idrol;
            $user->save();
 
 
            DB::commit();
 
        } catch (Exception $e){
            DB::rollBack();
        }
 
    }
 
    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $user = User::findOrFail($request->id);
        $user->condicion = '0';
        $user->save();
    }
 
    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $user = User::findOrFail($request->id);
        $user->condicion = '1';
        $user->save();
    }
 
 
}