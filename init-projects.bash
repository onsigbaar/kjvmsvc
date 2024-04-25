#!/usr/bin/env bash

mkdir microservices
cd microservices

spring init \
--boot-version=3.0.4 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=application-service \
--package-name=sc.app.microservices.core.application \
--groupId=sc.app.microservices.core.application \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
application-service

spring init \
--boot-version=3.0.4 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=review-service \
--package-name=sc.app.microservices.core.review \
--groupId=sc.app.microservices.core.review \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
review-service

spring init \
--boot-version=3.0.4 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=recommendation-service \
--package-name=sc.app.microservices.core.recommendation \
--groupId=sc.app.microservices.core.recommendation \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
recommendation-service

spring init \
--boot-version=3.0.4 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=application-store-service \
--package-name=sc.app.microservices.store.application \
--groupId=sc.app.microservices.store.application \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
application-store-service

cd ..