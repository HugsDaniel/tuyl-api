<template>
  <div id="login">
    <h3>Sign In</h3>

    <form v-on:submit.prevent="onSubmit">
      <div class="text-red" v-if="errors">{{ errors }}</div>

      <label for="email" class="label">E-mail Address</label>
      <input type="email" v-model="email" class="input" id="email" placeholder="andy@web-crunch.com">
      <label for="password" class="label">Password</label>
      <input type="password" v-model="password" class="input" id="password" placeholder="Password">
      <button type="submit">Sign In</button>

      <div><router-link to="/sign_up">Sign up</router-link></div>
  </form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'Login',
  data () {
    return {
      email: '',
      password: '',
      errors: []
    }
  },
  created () {
  },

  methods: {
    onSubmit () {
      axios.post('http://localhost:3000/login', { user: { email: this.email, password: this.password } })
        .then(request => this.loginSuccessful(request))
        .catch(() => this.loginFailed())
    },

    loginSuccessful (req) {
      if (!req.headers.authorization) {
        this.loginFailed()
        return
      }

      localStorage.token = req.headers.authorization
      localStorage.signedIn = true
      this.error = false

      this.$router.replace(this.$route.query.redirect || '/')
    },

    loginFailed () {
      console.log('Erreur !')
      this.error = 'Login failed!'
      delete localStorage.token
    }
  }
}
</script>
