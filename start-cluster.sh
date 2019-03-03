#!/usr/bin/env bash
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
sudo rm -r /volumedockerkafka/*
sudo rm -r /volumedockermysql/*
sudo rm -r /volumedockerdata/*
sudo mkdir -p /volumedockerkafka/zookeeper-1/zookeeper_data
sudo mkdir -p /volumedockerkafka/zookeeper-1/zookeeper_etc
sudo mkdir -p /volumedockerkafka/zookeeper-2/zookeeper_data
sudo mkdir -p /volumedockerkafka/zookeeper-2/zookeeper_etc
sudo mkdir -p /volumedockerkafka/zookeeper-3/zookeeper_data
sudo mkdir -p /volumedockerkafka/zookeeper-3/zookeeper_etc
sudo mkdir -p /volumedockerkafka/kafka-1/kafka_data
sudo mkdir -p /volumedockerkafka/kafka-1/kafka_etc
sudo mkdir -p /volumedockerkafka/kafka-2/kafka_data
sudo mkdir -p /volumedockerkafka/kafka-2/kafka_etc
sudo mkdir -p /volumedockerkafka/kafka-3/kafka_data
sudo mkdir -p /volumedockerkafka/kafka-3/kafka_etc
docker swarm leave --force
docker swarm init
docker stack deploy -c docker-compose.yml kafka_cluster

