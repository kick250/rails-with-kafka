import axios from 'axios';

axios.defaults.headers.common["Content-Type"] = 'application/json';
axios.defaults.headers.common["Accept"] = 'application/json';

export default class MoviesService {
  static build() {
    return new MoviesService(axios);
  }

  constructor(httpClient) {
    self._httpClient = httpClient;
  }

  async create(movieData) {
    const data = {
      name: movieData.name,
      category: movieData.category,
      image_link: movieData.imageLink,
      release_date: movieData.releaseDate
    }
    return self._httpClient.post("/movies", data);
  }

  async getAll() {
    try {
      const { data } = await self._httpClient.get("/movies");
      return data['results'];
    } catch (error) {
      console.log(error);
    }
  }
}