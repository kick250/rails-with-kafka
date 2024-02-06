namespace :consumer do
  desc 'kafka consumer'
  task up: :environment do
    config = Kafka::Config.build

    kafka = Kafka.new(config.servers)
    consumer = kafka.consumer(group_id: 'group1')

    config.topics.each do |topic|
      consumer.subscribe(topic)
    end

    consumer.each_message do |message|
      topic = message.topic
      data  = JSON.parse(message.value)

      Movies::Create.build.execute(data) if (topic == Movie::CREATE_TOPIC)

      puts "Processado #{topic}"
    end
  end
end
