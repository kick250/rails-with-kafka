module Kafka
  class Config
    def self.build
      new
    end

    def servers
      ['localhost:9092']
    end

    def topics
      [
        Movie::CREATE_TOPIC
      ]
    end
  end
end
