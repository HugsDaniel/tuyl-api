import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Activities from '@/components/Activities'
import Login from '@/components/Login'
import Signup from '@/components/Signup'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },

    {
      path: '/login',
      name: 'Login',
      component: Login
    },

    {
      path: '/sign_up',
      name: 'Signup',
      component: Signup
    },

    {
      path: '/activities',
      name: 'Activities',
      component: Activities
    }
  ]
})
