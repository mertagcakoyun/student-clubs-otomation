<template>
    <header class="fixed-top">
        <div class="header-top-menu">
            <nav class="navbar navbar-expand-lg">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">Anasayfa</li>
                    <li class="nav-item">İletişim</li>
                </ul>
            </nav>
        </div>
        <div class="header-main-menu">
            <div id="nav">
                <router-link to="/">Home</router-link> |
                <router-link to="/about">About</router-link>
            </div>
        </div>
    </header>
</template>

<script>
export default {
  name: 'HeaderTheme'
}
</script>

<style scoped lang="scss">
    header {
        background-color: aliceblue;
        height: 90px;
    }
    header {
        .header-top-menu {
            height: 30px;
            background-color: aquamarine;
        }
        .header-top-menu {
            nav {
                margin: 0;
                padding: 0;
            }
        }
        .header-main-menu {
            height: 60px;
            background-color: bisque;
        }
    }
    h1 {
        color: red;
    }
</style>
