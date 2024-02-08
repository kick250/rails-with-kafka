module Kafka
  class Config
    def self.build
      new
    end

    def servers
      ['kafka:9092']
    end

    def topics
      [
        Movie::CREATE_TOPIC
      ]
    end
  end
end
