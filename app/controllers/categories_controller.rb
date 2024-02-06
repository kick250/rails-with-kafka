class CategoriesController < ApplicationController
  def index
    render(
      json: { results: Category.all.map(&:to_hash) }
    )
  end
end