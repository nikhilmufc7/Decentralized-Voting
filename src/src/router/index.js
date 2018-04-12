import Vue from 'vue'
import Router from 'vue-router'
import VotePage from '@/components/VotePage'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'VotePage',
      component: VotePage
    }
  ]
})
