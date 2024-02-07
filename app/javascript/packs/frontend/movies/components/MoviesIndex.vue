<style scoped>
</style>

<template>
  <div class="row justify-content-center">
    <movies-form />
    <movies-list />
  </div>
</template>

<script>
import MoviesForm from './MoviesForm.vue';
import MoviesList from './MoviesList.vue';

export default {
  components: { MoviesForm, MoviesList },
}
</script>

