<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js + TypeScript App"/>
  </div>
</template>

<script>
import HelloWorld from '../components/hello-world.component.vue' // @ is an alias to /src
import {ClubsService, FoodMenuService} from '../services/service.config'

export default {
  name: 'Home',
  components: { HelloWorld },
  created () {
    ClubsService.getAllClubs()
        .then(function (res) {
            return res.data
        })
        .then(function (data) {
            console.log({message: "clubList", data});
        })
    FoodMenuService.getFoodMenu()
        .then(function (res) {
            return res.data
        })
        .then(function (data) {
            console.log({message: "foodMenu", data});
        })
  }
}

</script>
<style scoped lang="scss">
  .home {
    margin-top: 90px;
  }
</style>
