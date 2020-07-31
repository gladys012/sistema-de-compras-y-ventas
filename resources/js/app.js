
require('./bootstrap');

window.Vue = require('vue');
window.axios = axios;
//import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
//Vue.use(BootstrapVue)
//Vue.use(IconsPlugin)

Vue.component('categoria', require('./components/Categoria.vue').default);
Vue.component('articulo', require('./components/Articulo.vue').default);
Vue.component('cliente', require('./components/Cliente.vue').default);
Vue.component('proveedor', require('./components/Proveedor.vue').default);
Vue.component('rol', require('./components/Rol.vue').default);
Vue.component('user', require('./components/User.vue').default);
Vue.component('ingreso', require('./components/Ingreso.vue').default);


import swal from 'sweetalert2'
window.swal = swal;

//import 'bootstrap/dist/css/bootstrap.css';
//import 'bootstrap-vue/dist/bootstrap-vue.css';

//import { BootstrapVueIcons } from 'bootstrap-vue'
//import 'bootstrap-vue/dist/bootstrap-vue-icons.min.css'
import { nodeName } from 'jquery';

//Vue.use(BootstrapVueIcons)

const app = new Vue({
    el: '#app',
    data : {
        menu : 0,
        
    },
});