<template>
  <div id="activities">
    <div v-for="activity in activities" :key="activity.id">
     <p>{{activity.name}} : {{activity.description}}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Activities',
  data () {
    return {
      activities: [],
      name: [],
      description: [],
      errors: []
    }
  },
  created () {
    axios.get('http://localhost:3000/api/v1/activities', { headers: { Authorization: localStorage.token } })
      .then(response => {
        this.activities = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
  }
}
</script>
