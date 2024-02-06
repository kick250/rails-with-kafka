import axios from 'axios';


export default class CategoriesService {
  static build() {
    return new CategoriesService(axios);
  }

  constructor(httpClient) {
    self._httpClient = httpClient;
  }

  async getAll() {
    const { data } = await self._httpClient.get("/categories");
    return data['results'];
  }
}