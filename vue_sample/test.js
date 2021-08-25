var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!',
    selected: '',
    counter: 0,
  },
  methods: {
    plusOne: function(event) {
      this.counter +=1;
    },
    minusOne: function(event) {
      this.counter -=1;
    }
  }
});
