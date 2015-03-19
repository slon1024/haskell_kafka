module ProducerKafka where
  import Haskakafka
  import qualified Data.ByteString.Char8 as C8

  producer message = do
    let
        kafkaConfig = [("socket.timeout.ms", "50000")]
        topicConfig = [("request.timeout.ms", "50000")]
        partition   = 0
        broker      = "10.77.1.2:9092"
        topic       = "test"


    withKafkaProducer kafkaConfig topicConfig broker topic
        $ \kafka topic ->
            -- produceMessage topic (KafkaSpecifiedPartition partition) kafkaMessage
            -- produceKeyedMessage topic keyMessage
            produceMessageBatch topic KafkaUnassignedPartition messages
            where
                kafkaMessage = KafkaProduceMessage $ C8.pack message
                keyMessage = KafkaProduceKeyedMessage (C8.pack "Key") (C8.pack message)
                messages  = replicate 1 kafkaMessage



  main = producer "message1" >>= print.show
