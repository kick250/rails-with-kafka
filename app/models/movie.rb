class Movie < ActiveRecord::Base
  CREATE_TOPIC = 'movies.create'.freeze

  belongs_to :category

  def to_hash
    {
      id: self.id,
      name: self.name,
      category: self.category_label,
      image_link: self.image_link,
      release_date: self.release_date&.strftime("%d/%m/%Y")
    }
  end

  def category_label
    self.category.label
  end
end
