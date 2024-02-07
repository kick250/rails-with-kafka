import axios from 'axios';


export default class CategoriesService {
  static build() {
    return new CategoriesService(axios);
  }

  constructor(httpClient) {
    self._httpClient = httpClient;
  }

  async getAll() {
    try {
      const { data } = await self._httpClient.get("/categories");
      return data['results'];
    } catch (error) {
      console.log(error);
    }
  }
}