<template>
  <div id="app">
    <header-theme/>
    <router-view/>
  </div>
</template>
<script>
import HeaderTheme from './themes/header.theme'
export default {
  name: 'App',
  components: { HeaderTheme }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 15px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
.home {
  margin-top: 90px;
}
.about {
  margin-top: 90px;
}
</style>
