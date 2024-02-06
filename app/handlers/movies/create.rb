module Movies
  class Create
    def self.build
      new
    end

    def execute(data)
      data = data.with_indifferent_access

      movie_params = {
        name: data[:name],
        category_id: data[:category],
        image_link: data[:image_link],
        release_date: data[:release_date]
      }

      Movie.create(movie_params)
    rescue => error
      puts error
    end
  end
end
