#!/usr/bin/env sh

CLUSTER=$1
SERVICE=$2

# Retrieve the ECS task ID
TASK=$(aws ecs list-tasks --cluster $CLUSTER --service $SERVICE --desired-status RUNNING --output text --query 'taskArns[0]')
TASK_ID=$(awk -F/ '{print $NF}' <<<"$TASK")

echo "Connecting to task: $TASK_ID in the $SERVICE service in the $CLUSTER cluster"
echo 

# Execute ECS exec command

echo "running aws ecs execute-command --cluster $CLUSTER --task $TASK_ID --container $SERVICE --command "/bin/bash" --interactive"
aws ecs execute-command --cluster $CLUSTER --task $TASK_ID --container $SERVICE --command "/bin/bash" --interactive
