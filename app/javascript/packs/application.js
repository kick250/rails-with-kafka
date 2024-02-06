import { createApp } from 'vue/dist/vue.esm-bundler.js';
import MoviesIndex from './frontend/movies/components/MoviesIndex.vue';


document.addEventListener("DOMContentLoaded", () => {
  createApp({
    components: {
      'movies-index': MoviesIndex
    }
  }).mount("#app");
})