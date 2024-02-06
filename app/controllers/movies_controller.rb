class MoviesController < ApplicationController
  def index
  end

  def create
    movie_params
  end

  private

  def movie_params
    params.permit(:name, :category, :image_link, :release_date)
  end
end