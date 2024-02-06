class Movie < ActiveRecord::Base
  CREATE_TOPIC = 'movies.create'.freeze

  belongs_to :category
end
