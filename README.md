# Purpose
Test Spring XD Failover

# Application 
 * Kafka 
 * Zookeeper
 * Redis 
 * Spring XD
 
## Configuration 
 
* 5 Kafka nodes
* 3 Zookeeper nodes
* 3 Redis node
* 3 Spring XD

## Applications

### Kafka

#### Positive test #1 
* Start kafka producer (could be used kafka perf producer: "kafka-run-class.sh org.apache.kafka.clients.tools.ProducerPerformance") 
* Stop 2 kafka nodes
* Stop 1 zk nodes

Result: After partitions rebalancing producer MUST work as usual 

#### Positive test #2
* Create topic with replication factor 1, partition 1
* Find leader for topic (for example: for topic test3 leader node #1)
* Stop 2,3,4,5 Kafka nodes

Result: Topic should work as usual

#### Positive test #3
* Kill all kafkas
* Start kafka 

Result: Kafka start after recover log



#### Negative test #1
* Stop 2 zk noded

Result: Kafka stop working. (no zookeeper leader)

#### Negative test #2 
* Create topic with replication factor 3
* Stop 3 kafka

Result: Kafka stop working (no kafka leader)




### Zookeeper

#### Positive test #1 
* Stop 1 zookeeper leader node
Result: After leader election MUST work as usual

#### Negative test #1
Stop 2 zookeeper nodes
Result: Cluster stop working in order to prevent split brain

#### Monitoring

https://github.com/phunt/zktop



### Redis

#### Positive test #1 
* Stop redis master node
Result: After failover-timeout new master elected

#### Positive test #2
* Stop 2 redis slave, 1 sentinel node
Result: work as usual

#### Negative test #1
* Network split between redis (1 master + 1 sentinel one network, 2 redis 2 sentinel in another)
In a new network with 2 redis new master will be elected
Result: After election we have 2 master (split brain)

CAUTION: When connection with two network back, one master will be elected, and data from master (1 redis, 1 sentinel) will be lost forever. 
See example #2 http://redis.io/topics/sentinel

### Spring XD

#### Positive test #1
* Start streams 
* Increase number message producers

Result:
* Lag increase after increase number produces
* Log size and offset equals after stop producing messages


#### Positive test #2
* Stop 4 Spring XD Admin

Result:
* New Spring XD Admin master elected.

#### Positive test #2
* Stop all 5 Spring XD Admin 

Result: Streams continue working 

#### Positive test #3
* Stop all kafka, zookeeper, redis 
* Start all kafka, zookeeper, redis

Result: 
* Streams redeploy, module spread across container but not efficient (some container empty, some have more that one module) 

#### Positive test #4
* Stop Zookeeper leader node

Result: 
* Streams continue working (offsetManagement: kafkaNative) and trying to connect to new leader. 

Positive test #5 
* Kill kafka 3
* Kill kafka 1 
* Start kafka 1,3
* Kill kafka 2

Result:
* Kafka log recover after hard kill
 
#### Negative test #0
* Produce messages through jmeter 

Result:
* After stop producing messages, we still have massage lag.

#### Negative test #1
* Stop 3 Kafka nodes 
Result:
* Streams status turned to failed

#### Negative test #2
* Stop 2 zookeeper nodes

Result: 
* Cluster stop working in order to prevent split brain

#### Negative test #3
* Stop and clear data  kafka, zookeeper and redis 
* Start kafka, zookeeper, redis 

Result:
* Until springXD service not restarted, producing errors and not able to create streams
 
#### Negative test #4
* Stop 2 Spring XD Containers 

Result:
* Stream turn to "failed" status. After manual redeploy streams all streams start working. 


