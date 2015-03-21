# Haskell + Kafka = :heart::heart::heart:

## Prerequisites
* [Kafka](http://kafka.apache.org/) & [ZooKeeper](http://zookeeper.apache.org/) you can use this setup [vagrant](https://github.com/slon1024/vagrant-cluster-storm)
* `cabal install` [haskakafka](https://github.com/cosbynator/haskakafka)

## Examples
* [producer](https://github.com/slon1024/haskell_kafka/blob/master/Producer.hs)
* [consumer](https://github.com/slon1024/haskell_kafka/blob/master/Consumer.hs) 

## Run it
* `vangrant up` #see prerequisites
* `runhaskell Producer.hs`
* `runhaskell Consumer.hs`
