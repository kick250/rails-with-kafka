<style>

</style>

<template>
  <div class="row mt-5">
    <div class="col-3 mb-4" v-for="movie in movies" :key="movie.id">
      <div class="card w-100">
        <img :src="movie.image_link" class="card-img-top" alt="Capa do filme" width="auto" height="250px">
        <div class="card-body text-center">
          <h5 class="card-title">{{ movie.name }}</h5>
          <p>{{ movie.category }}</p>
          <p>{{ movie.release_date }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import MoviesService from '../services/MoviesService';


export default {
  data() {
    return {
      movies: []
    }
  },

  mounted() {
    this.loadMovies();

    setInterval(
      () => this.loadMovies(),
      8000
    );
  },

  methods: {
    async loadMovies() {
      const service = MoviesService.build();
      this.movies = await service.getAll();
    }
  }
}
</script>