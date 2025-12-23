#!/bin/bash

# 1. 배포 폴더로 이동
REPOSITORY=/home/ec2-user/app/step1
cd $REPOSITORY

# 2. JAR 파일 이름 찾기
JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)

# 3. 로그 파일 위치 지정 (CloudWatch가 기다리는 그 파일!)
LOG_FILE=$REPOSITORY/nohup.out

echo "> JAR Name: $JAR_NAME"
echo "> Log File: $LOG_FILE"

# 4. 실행 (핵심: /dev/null 대신 $LOG_FILE에 저장해라!)
nohup java -jar $JAR_NAME > $LOG_FILE 2>&1 &