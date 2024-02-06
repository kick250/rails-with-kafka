import axios from 'axios';


export default class MoviesService {
  static build() {
    return new MoviesService(axios);
  }

  constructor(httpClient) {
    self.httpClient = httpClient;
  }

  async create(movieData) {
    const data = {
      name: movieData.name,
      category: movieData.category,
      image_link: movieData.imageLink,
      release_date: movieData.releaseDate
    }
    return self.httpClient.post("/movies", data);
  }
}