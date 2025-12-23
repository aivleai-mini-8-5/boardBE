#!/bin/bash
echo "Starting application..."
cd /home/ec2-user/app/step1
chmod +x ./*.jar
# jar 파일 실행 (로그 남기기)
nohup java -jar ./*SNAPSHOT.jar > /dev/null 2>&1 &