#!/bin/bash

# 1. CloudWatch Agent 다운로드 및 설치 (Amazon Linux 2023 기준)
dnf install -y amazon-cloudwatch-agent

# 2. 에이전트 설정 파일 생성 (JSON)
# (nohup.out 파일을 추적해서 'WebAppLogs'라는 그룹에 저장하라는 설정입니다)
cat <<EOF > /opt/aws/amazon-cloudwatch-agent/bin/config.json
{
  "agent": {
    "run_as_user": "root"
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/home/ec2-user/app/step1/nohup.out",
            "log_group_name": "a1174-backend-logs",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  }
}
EOF

# 3. 에이전트 실행 (설정 적용)
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json \
    -s