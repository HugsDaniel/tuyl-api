<template>
  <div id="login">
    <h3>Sign In</h3>

    <form v-on:submit.prevent="onSubmit">
      <div class="text-red" v-if="errors">{{ errors }}</div>

      <label for="email" class="label">E-mail Address</label>
      <input type="email" v-model="email" class="input" id="email" placeholder="andy@web-crunch.com">
      <label for="password" class="label">Password</label>
      <input type="password" v-model="password" class="input" id="password" placeholder="Password">
      <label for="password_confirmation" class="label">Password confirmation</label>
      <input type="password" v-model="password_confirmation" class="input" id="password_confirmation" placeholder="Password confirmation">
      <button type="submit">Sign up</button>

      <div><router-link to="/sign_up">Sign up</router-link></div>
  </form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'Signup',
  data () {
    return {
      email: '',
      password: '',
      password_confirmation: '',
      errors: []
    }
  },
  created () {
  },

  methods: {
    onSubmit () {
      axios.post('http://localhost:3000/sign_up', { user: { email: this.email, password: this.password, password_confirmation: this.password_confirmation } })
        .then(request => this.loginUser(this))
        .catch(() => this.loginFailed())
    },

    loginUser (data) {
      axios.post('http://localhost:3000/login', { user: { email: data.email, password: data.password } })
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
      this.error = 'Login failed!'
      delete localStorage.token
    }
  }
}
</script>
