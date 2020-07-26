<template>
    <main class="main">
        <!-- Breadcrumb -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Escritorio</a></li>
        </ol>
        <div class="container-fluid">
            <!--Tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <h3> Usuarios</h3>                        
                    <b-button variant="info  pull-right" @click="abrirModal('personas','registrar')" style="right:0;"><b-icon-plus font-scale="1.5"></b-icon-plus>Nuevo</b-button>
                </div>
                <div class="card-body"> 
                    <b-row>                        
                    <b-col lg="6" class="my-1">
                        <b-form-group
                        label="Filtrar"
                        label-cols-sm="3"
                        label-align-sm="right"
                        label-size="md"
                        label-for="filterInput"
                        class="mb-0"
                        >
                        <b-input-group size="md">
                            <b-form-input
                            v-model="filter"
                            type="search"
                            id="filterInput"
                            placeholder="Introduce la búsqueda"
                            ></b-form-input>
                            <b-input-group-append>
                            <b-button :disabled="!filter" @click="filter = ''" variant="info">Buscar</b-button>
                            </b-input-group-append>
                        </b-input-group>
                        </b-form-group>
                    </b-col> 
                    <b-col sm="4" md="6" class="my-1">
                        <b-form-group
                        label="Mostrar registros"
                        label-cols-sm="6"
                        label-cols-md="4"
                        label-cols-lg="3"
                        label-align-sm="right"
                        label-size="md"
                        label-for="perPageSelect"
                        class="mb-0"
                        >
                        <b-form-select
                            v-model="perPage"
                            id="perPageSelect"
                            size="md"
                            :options="pageOptions"
                        ></b-form-select>
                        </b-form-group>
                    </b-col>                   
                    </b-row>                                                                              
                    <b-table
                        show-empty striped
                        hover responsive 
                        stacked="md"
                        :items="arrayPersonas"
                        :fields="columnas"
                        :current-page="currentPage"
                        :per-page="perPage"
                        :filter="filter"
                        :filterIncludedFields="filterOn"
                        :sort-by.sync="sortBy"
                        :sort-desc.sync="sortDesc"
                        :sort-direction="sortDirection"                     
                    >
                        <template v-slot:head(paterno)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>  
                        <template v-slot:head(materno)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>  
                        <template v-slot:head(nombre)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>  
                        <template v-slot:head(ci)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>  
                        <template v-slot:head(rol)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>   
                        <template v-slot:head(usuario)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>  
                        <template v-slot:head(acciones)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>   
                        <template v-slot:head(acciones)="data">
                            <span class="text-primary">{{ data.label }}</span>
                        </template>                         
                        <template v-slot:cell(acciones)="row">
                        <a href="#" @click="abrirModal('personas','actualizar',row.item)" v-b-tooltip.hover title="Actualizar">
                            <b-icon-pencil-square variant="info" font-scale="1.5"></b-icon-pencil-square>
                        </a>
                        <a href="#" @click="row.toggleDetails" v-b-tooltip.hover.d50 title="Detalles">
                            <b-icon-eye-fill variant="info" font-scale="1.5"></b-icon-eye-fill >
                        </a>                                        
                        </template>
                        <template v-slot:row-details="row">
                            <b-card>
                                <ul>
                                <li v-for="(value, key) in row.item" :key="key">{{ key }}: {{ value }}</li>
                                </ul>
                            </b-card>
                        </template>
                    </b-table>
                    <b-row>
                    <b-col sm="7" md="6" class="my-1">
                        <b-pagination
                        v-model="currentPage"
                        :total-rows="totalRows"
                        :per-page="perPage"
                        align="fill"
                        size="sm"
                        class="my-0"
                        ></b-pagination>
                    </b-col>
                    </b-row>
                </div>
            </div>
            <!-- Fin -->
        </div>
        <!--Inicio del modal agregar/ modificar-->
        <div class="modal fade" :class="{'mostrarr' : modal}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <b-form @submit="onSubmit" v-if="show">
                       <div class="row">
                         <div class="form-group col-sm-4">
                            <b-form-group id="input-group-1"  label="Paterno:" label-for="input-2" >
                                <b-form-input id="input-1" v-model="paterno" placeholder="Paterno" required                            
                                ></b-form-input>
                            </b-form-group>
                         </div>
                         <div class="form-group col-sm-4">
                            <b-form-group id="input-group-2"  label="Materno:" label-for="input-2" >
                                <b-form-input id="input-2" v-model="materno" placeholder="Materno"                             
                                ></b-form-input>
                            </b-form-group>
                         </div>
                         <div class="form-group col-sm-4">
                            <b-form-group id="input-group-3"  label="Nombre:" label-for="input-2" >
                                <b-form-input id="input-3" v-model="nombre" placeholder="Nombre" required                            
                                ></b-form-input>
                            </b-form-group>
                         </div>                         
                       </div>                    
                       <div class="row">
                          <div class="form-group col-sm-4">
                            <b-form-group id="input-group-4"  label="Carnet de Identidad:" label-for="input-4" >
                                <b-form-input id="input-4" v-model="ci" placeholder="Carnet de identidad" required                            
                                ></b-form-input>
                            </b-form-group>
                         </div> 
                         <div class="form-group col-sm-4">
                            <b-form-group id="input-group-5"  label="Teléfono:" label-for="input-5" >
                                <b-form-input id="input-5" v-model="telefono" placeholder=" Teléfono o celular" required                            
                                ></b-form-input>
                            </b-form-group>
                         </div>
                         <div class="form-group col-lg-4">
                            <b-form-group id="input-group-6" label="Email:" label-for="input-6">
                                <b-form-input id="input-6" 
                                    v-model="email"  type="email" placeholder="Email" required>
                                </b-form-input>
                            </b-form-group>
                         </div>                                                  
                       </div>
                       <div class="row">
                          <div class="form-group col-sm-12">
                              <b-form-group id="input-group-6" label="Dirección:" label-for="input-6">
                                <b-form-input id="input-6" 
                                    v-model="direccion"  type="text" placeholder="Introduzca la dirección">
                                </b-form-input>
                            </b-form-group>
                          </div>
                       </div> 
                       <div class="row">
                       <div class="form-group col-sm-4">
                            <b-form-group id="input-group-2"  label="Roles:" label-for="input-2" >                                                              
                            <b-form-select v-model="idrol" class="mb-3" required>
                                <b-form-select-option value="0" disabled>-- Seleccionar --</b-form-select-option>
                                <b-form-select-option v-for="rol in arrayRol" :key="rol.id" :value="rol.id" v-text="rol.nombre"></b-form-select-option>
                            </b-form-select> 
                            </b-form-group>
                       </div> 
                         <div class="form-group col-sm-4">
                            <b-form-group id="input-group-5"  label="Usuario:" label-for="input-5" >
                                <b-form-input id="input-5" v-model="usuario" placeholder=" Usuario" required                            
                                ></b-form-input>
                            </b-form-group>
                         </div> 
                         <div class="form-group col-sm-4">
                            <b-form-group id="input-group-5"  label="password:" label-for="input-5" >
                                <b-form-input id="input-5" type="password" v-model="password" placeholder=" password" required                            
                                ></b-form-input>
                            </b-form-group>
                         </div>
                        </div> 
                       <div class="form-group col-sm-12">
                        <b-alert
                            :show="dismissCountDown"
                            dismissible
                            variant="danger"
                            @dismiss-count-down="countDownChanged">
                                Ingreso un Carnet de Identidad existente
                            </b-alert>
                        </div>     
                      <div class="modal-footer">
                        <b-button type="reset" variant="secondary" @click="cerrarModal()">Cerrar</b-button>
                        <b-button type="submit" v-if="tipoAccion==1" variant="primary" @click="registrarPersona()">Guardar</b-button>
                        <b-button type="submit" v-if="tipoAccion==2" variant="primary" @click="actualizarPersona()">Actualizar</b-button>
                      </div>
                    </b-form>                   
                </div>                
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-d -->
    </div>
    <!--Fin del modal-->
  </main>
</template>

<script>

    export default {
        data (){            
            return {
                personas_id: 0,
                nombre:'',
                paterno:'',
                materno:'',
                telefono : '',
                direccion: '',
                email:'',
                ci:'',
                usuario:'',
                password:'',
                verificaCi:0,
                arrayPersonas : [],
                arrayPersonasTab : [],
                arrayRol:[],
                idrol : 0,
                tituloModal : '',

                modal : 0,                
                tipoAccion : 0,
                dismissSecs: 5,
                dismissCountDown: 0,
                show: true,
                columnas: [
                  { key: 'paterno', label: 'Paterno', sortable: true, sortDirection: 'desc' },
                  { key: 'materno', label: 'Materno', sortable: true, class: 'text-justify' },                 
                  { key: 'nombre', label: 'Nombre', sortable: true },                 
                  { key: 'ci', label: 'C.I.', sortable: true },                 
                  { key: 'usuario', label: 'Usuario', sortable: true },                 
                  { key: 'rol', label: 'Rol', sortable: true },                 
                  { key: 'acciones', label: 'Acciones',  sortable: false}
                ],
                perPage: 10,
                selectedID: null,
                totalRows: 1,
                currentPage: 1,
                pageOptions: [10, 15, 20,50,100,200],
                sortBy: '',
                sortDesc: false,
                sortDirection: 'asc',
                filter: null,
                filterOn: [],
            }
        },

        computed:{

        },
        methods : {

            onFiltered(filteredItems) {
              // Trigger pagination to update the number of buttons/pages due to filtering
              this.totalRows = filteredItems.length;
              this.currentPage = 1
            },
            listarPersonas (){
                let me=this;
                var url= '/user';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPersonas = respuesta.personas.data;
                    me.totalRows = me.arrayPersonas.length;
                    console.log(me.arrayPersonas,'me.arrayPersonas...');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },          
            countDownChanged(dismissCountDown) {  //alert ci
                this.dismissCountDown = dismissCountDown
            },
            onSubmit(evt) {
                evt.preventDefault()  //val. form
            },
            registrarPersona(){  
                let me = this;
                for (let i = 0; i < this.arrayPersonas.length; i++) {
                    if ( this.ci == me.arrayPersonas[i].ci ) {
                      this.verificaCi = 1;   
                    }                   
                }
                if (this.verificaCi == 0 && this.ci!='') {
                    console.log('entra 0');
                        axios.post('/user/registrar',{
                        'nombre': this.nombre,
                        'paterno': this.paterno,
                        'materno' : this.materno,
                        'ci' : this.ci,
                        'telefono' : this.telefono,
                        'email' : this.email,
                        'direccion' : this.direccion,
                        'usuario': this.usuario,
                        'password': this.password,
                        'idrol' : this.idrol,
                        'usr_id':1,

                        }).then(function (response) {                   
                        me.listarPersonas();
                        me.cerrarModal();   
                    }).catch(function (error) {
                            console.log(error);
                    });
                }else if(this.verificaCi == 1 && this.ci!=''){ 
                    this.dismissCountDown = this.dismissSecs;
                    this.verificaCi = 0;}                
           },
            
            actualizarPersona(){             
                let me = this;
                /* for (let i = 0; i < this.arrayPersonas.length; i++) {
                    if ( this.ci == me.arrayPersonas[i].ci ) {
                      this.verificaCi = 1;   
                    }                   
                }
                if (this.verificaCi == 0 && this.ci!='') {*/
                axios.put('/user/actualizar',{
                    'nombre': this.nombre,
                    'paterno': this.paterno,
                    'materno': this.materno,
                    'ci' : this.ci,
                    'direccion' : this.direccion,
                    'telefono' : this.telefono,
                    'email' : this.email,
                    'usuario': this.usuario,
                    'password': this.password,
                    'idrol' : this.idrol,
                    'usr_id': 1,
                    'id': this.persona_id                   
                }).then(function (response) {
                    me.listarPersonas();
                    me.cerrarModal();
                }).catch(function (error) {
                    console.log(error);
                }); 
              /*  }else if(this.verificaCi == 1 && this.ci!=''){ 
                this.dismissCountDown = this.dismissSecs;
                this.verificaCi = 0;} */
            },
            
            selectRol(){
                let me=this;
                var url= '/rol/selectRol';
                axios.get(url).then(function (response) {
                    console.log(response,'response rol');
                    var respuesta= response.data;
                    me.arrayRol = respuesta.roles;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.idpreparacion= 0;
                this.paterno='',
                this.materno = '';
                this.nombre = '';
                this.ci = '';
                this.direccion = '';
                this.email= '';
                this.telefono= '';                
                this.usuario='';
                this.password='';
                this.idrol=0;
            },
            abrirModal(modelo, accion, data = []){
                this.selectRol();
                switch(modelo){
                    case "personas":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar datos Usuarios';
                                this.idpersona= 0;
                                this.paterno='',
                                this.materno = '';
                                this.nombre = '';
                                this.ci = '';
                                this.direccion = '';
                                this.email= '';
                                this.telefono= '';
                                this.usuario='';
                                this.password='';
                                this.idrol=0;
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                this.modal=1;
                                this.tituloModal='Actualizar datos Usuarios';
                                this.tipoAccion=2;
                                this.personas_id=data['id'];
                                this.idpreparacion=data['idpreparacion'];
                                this.paterno = data['paterno'];
                                this.materno=data['materno'];
                                this.nombre=data['nombre'];
                                this.ci=data['ci'];
                                this.direccion=data['direccion'];
                                this.email= data['email'];
                                this.telefono= data['telefono'];
                                this.usuario = data['usuario'];
                                this.password = data['password'];
                                this.idrol = data['idrol'];
                                break;
                            }
                        }
                    }
                }
            },
            desactivarUsuario(id){
               swal.fire({
                title: 'Esta seguro de desactivar este usuario?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('/user/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPersona(1,'','nombre');
                        swal.fire(
                        'Desactivado!',
                        'El registro ha sido desactivado con éxito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.fire.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
            activarUsuario(id){
               swal.fire({
                title: 'Esta seguro de activar este usuario?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('/user/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPersona(1,'','nombre');
                        swal.fire(
                        'Activado!',
                        'El registro ha sido activado con éxito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.fire.DismissReason.cancel
                ) {
                    
                }
                }) 
            }
        },
        mounted() {            
            this.listarPersonas();            
        }
    }
</script>
<style>    
    .modal-content{
        width: 100% !important;
        position: absolute !important;
    }
    .mostrar{
        display: list-item !important;
        opacity: 1 !important;
        position: absolute !important;
        background-color: #3c29297a !important;
    }          
</style>
