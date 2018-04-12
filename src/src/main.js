// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Buefy from 'buefy'
import VueSweetalert2 from 'vue-sweetalert2'
import 'buefy/lib/buefy.css'
import App from './App'
import router from './router'

Vue.config.productionTip = false
Vue.use(Buefy)
Vue.use(VueSweetalert2)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
