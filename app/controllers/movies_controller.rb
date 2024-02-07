class MoviesController < ApplicationController
  def index
    respond_to do |format|

      format.html do
        render :index
      end

      format.json do
        render(
          json: { results: Movie.all.map(&:to_hash) }
        )
      end
     end
  end

  def create
    broker = Kafka::BrokerIntegration.build

    broker.publish(message: movie_params, topic: Movie::CREATE_TOPIC)

    render(
      json: { result: 'success' },
      status: :ok
    )
  end

  private

  def movie_params
    params.permit(:name, :category, :image_link, :release_date)
  end
end
