<template>
  <div id="app">
    <p>{{ message }}</p>
    <form v-on:submit="onSubmit">
      <label>本タイトル
        <input id="name" v-model="book_name">
        <button type="submit">登録</button>
      </label>
    </form>

    <div v-for="book in books" :key="book.id">
      <p>{{book.name}}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      book_name: '',
      books: []
    }
  },
  mounted() {
    axios.get('/api/books')
    .then(response => {
      this.books = response.data.books
    })
  },
  methods: {
    onSubmit() {
      axios.post('/api/book', { name: this.book_name})
      .then(response => {
        this.book_name = ""
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
