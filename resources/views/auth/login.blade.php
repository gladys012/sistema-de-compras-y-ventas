@extends('auth.contenido')

@section('login')
<div class="container">
  <div class="divlogin">  
    <div class="container2">
      <div class="row justify-content-center">
        <div class="card p-8 divcont">
          <img :src="require('./assets/images/material.jpg')" />
          <img :src="require('./assets/images/fondoapp.png')" />
          <form class="form-horizontal was-validated" method="POST" action="{{ route('login')}}">
                {{ csrf_field() }}
              <div class="card-body">
              <h1>Inicio de Sesión</h1>
              <p class="text-muted">Control de acceso al sistema</p>
              <div class="form-group mb-3{{$errors->has('usuario' ? 'is-invalid' : '')}}">
                <input type="text" value="{{old('usuario')}}" name="usuario" id="usuario" class="form-control" placeholder="Usuario">
                {!!$errors->first('usuario','<span class="invalid-feedback">:message</span>')!!}
              </div>
              <div class="form-group mb-4{{$errors->has('password' ? 'is-invalid' : '')}}">
                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                {!!$errors->first('password','<span class="invalid-feedback">:message</span>')!!}
              </div>
              <div class="row">
                <div class="col-6">
                  <button type="submit" class="btn btn-primary px-4">Acceder</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

<style>
  body {
    background: url(https://cdn.vuetifyjs.com/images/parallax/material.jpg)
    no-repeat;
    background-size: cover;
    width: 100%;
    height: 100%;
  }
.divlogin {
  background-position: center top;
  width: 100%;
  height: 100%;
  display: flex;  
  align-content: center;
  align-items: center;
}
.divlogin .container2 {
  width: 100%;
  text-align: center;
}
.divlogin .container2 .divcont {
  width: 100%;
  max-width: 300px;
  background: rgba(255, 255, 255, 0.7);
  padding: 20px;
  border-radius: 10px;
  display: inline-block;
}
.divlogin .container2 .divcont h3 {
  margin-top: 0px;
}
.divlogin .container2 .divcont input {
  height: 30px;
  margin: 0px;
  border: 0px;
  outline: none;
  padding: 10px;
  border-radius: 5px;
  width: 90%;
  margin-bottom: 10px;
}
.divlogin .container2 .divcont button {
  margin: 0px;
  border: 0px;
  display: block;
  margin: auto;
  padding: 10px 30px;
  background: #333;
  color: #fff;
  border-radius: 5px;
  margin-bottom: 10px;
}
.divlogin .container2 .divcont a {
  font-size: 12px;
  margin-right: 10px;
  color: #333;
}
.container2 {
  padding: 0px;
}
</style>