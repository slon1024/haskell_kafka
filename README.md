# Haskell + Kafka = :heart::heart::heart:

## Prerequisites
* [Kafka](http://kafka.apache.org/) & [ZooKeeper](http://zookeeper.apache.org/) (*you can use this  [vagrant](https://github.com/slon1024/vagrant-cluster-storm) setup*)
* `cabal install` [haskakafka](https://github.com/cosbynator/haskakafka)

## Examples
* [Producer](https://github.com/slon1024/haskell_kafka/blob/master/Producer.hs)
* [Consumer](https://github.com/slon1024/haskell_kafka/blob/master/Consumer.hs) 

## Run it
* `vangrant up` #see prerequisites
* `runhaskell Producer.hs`
* `runhaskell Consumer.hs`
