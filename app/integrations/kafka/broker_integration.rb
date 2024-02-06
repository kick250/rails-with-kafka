require 'kafka'

module Kafka
  class BrokerIntegration
    def self.build
      servers = ['localhost:9092']
      new(
        kafka: Kafka.new(servers)
      )
    end

    def initialize(kafka:)
      @kafka = kafka
    end

    def publish(message:, topic:)
      @kafka.deliver_message(message.to_json, topic: topic)
    end
  end
end
