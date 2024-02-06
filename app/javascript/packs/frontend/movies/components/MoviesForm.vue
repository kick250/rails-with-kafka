<style scoped>
  .card {
    width: 450px;
    padding: 0px 0px !important;
  }

  .form-group {
    margin-bottom: 20px;
  }

  .form-group label {
    margin-bottom: 5px;
  }
</style>

<template>
  <div class="card">
    <h5 class="card-header">Cadastrar filme</h5>
    <div class="card-body d-flex flex-column align-items-end">
      <div class="alert alert-danger w-100" role="alert" v-show="error">
        {{ error }}
      </div>
      <div class="form-group w-100">
        <label>Nome</label>
        <input class="form-control" type="text" placeholder="Nome" v-model="name" />
      </div>
      <div class="form-group w-100">
        <label>Categoria</label>
        <select v-model="category" class="form-control">
          <option :value="undefined" selected disabled>Categoria</option>
          <option v-for="option in categories" :key="option.id" :value="option.id">
            {{ option.label }}
          </option>
        </select>
      </div>
      <div class="form-group w-100">
        <label>Imagem</label>
        <input class="form-control" type="text" placeholder="Imagem" v-model="imageLink" />
      </div>
      <div class="form-group w-100">
        <label>Data de lançamento</label>
        <input class="form-control" type="date" placeholder="Data de lançamento" v-model="releaseDate" />
      </div>
      <button class="btn btn-primary" type="button" @click="create">Cadastrar</button>
    </div>
  </div>
</template>

<script>
import CategoriesService from '../services/CategoriesService';
import MoviesService from '../services/MoviesService';


export default {
  data() {
    return {
      categories: [],
      name: "",
      category: undefined,
      imageLink: "",
      releaseDate: "",
      error: ""
    }
  },
  mounted() {
    this.loadCategories();
  },
  methods: {
    async loadCategories() {
      const service = CategoriesService.build();
      this.categories = await service.getAll();
    },

    getMovieData() {
      return {
        name: this.name,
        category: this.category,
        imageLink: this.imageLink,
        releaseDate: this.releaseDate
      };
    },

    create() {
      if (!this.checkFields()) return;

      const service = MoviesService.build();
      service.create(this.getMovieData())
        .then(response => console.log(response))
        .catch(error => console.log(error));
    },

    checkFields() {
      if (!this.name) {
        this.error = "Um filme precisa de um nome.";
        return false;
      }
      if (!this.category) {
        this.error = "Um filme precisa de uma categoria.";
        return false;
      }
      if (!this.imageLink) {
        this.error = "Um filme precisa de uma imagem.";
        return false;
      }
      if (!this.releaseDate) {
        this.error = "Um filme precisa de uma data de lançamento."
        return false;
      }

      return true;
    }
  }
}
</script>