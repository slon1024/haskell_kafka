module ConsumerKafka where
  import Haskakafka
  import qualified Data.ByteString.Char8 as C8

  consumer = do
    let
        kafkaConfig = [("socket.timeout.ms", "50000")]
        topicConfig = [("request.timeout.ms", "50000")]
        partition   = 0
        broker      = "10.77.1.2:9092"
        topic       = "test"
        offset      = 0
        timeoutMs   = 1000
        maxMessages = 100

    withKafkaConsumer kafkaConfig topicConfig
        broker topic partition (KafkaOffset offset) -- KafkaOffsetBeginning, KafkaOffsetEnd, KafkaOffset or KafkaOffsetStored)
        $ \kafka topic -> batchGetter kafka topic partition timeoutMs maxMessages

  singleGetter kafka topic partition timeoutMs = do
    me <- consumeMessage topic partition timeoutMs
    putStrLn $ getMessage me

  batchGetter kafka topic partition timeoutMs maxMessages = do
    mes <- consumeMessageBatch topic partition timeoutMs maxMessages
    case mes of
      (Left err)      -> putStrLn $ "Something went wrong in batch consume! " ++ show err
      (Right events)  -> putStrLn $ show $ [prepareMessage event | event <- init events]


  getMessage :: Show l => (Either l KafkaMessage) -> String
  getMessage (Left err)    =  "Something went wrong! " ++ show err
  getMessage (Right event) =  prepareMessage event


  prepareMessage :: KafkaMessage -> String
  prepareMessage event = offset ++ ":" ++ payload
    where
        offset  = show $ messageOffset event
        payload = C8.unpack $ messagePayload event

  main = consumer
