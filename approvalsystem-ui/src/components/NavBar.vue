<template>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-primary">
  <a class="navbar-brand" href="#">
    <img src="../assets/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
    社内申請
  </a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
    </ul>
    <span class="font-weight-bolder mx-2">ログイン者</span>
    <input type="button" value="ログアウト" class="btn btn-square-pop-orange-long"/>

    
  </div>
</nav>
</template>

<script>
export default {
  name: 'NavBar',
  props: {
    msg: String
  }
}
</script>
<style src="../assets/css/style.css"></style>
