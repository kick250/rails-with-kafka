class MoviesController < ApplicationController
  def index
  end

  def create
    broker = Kafka::BrokerIntegration.build

    broker.publish(message: movie_params, topic: Movie::CREATE_TOPIC)
  end

  private

  def movie_params
    params.permit(:name, :category, :image_link, :release_date)
  end
end
