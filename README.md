# ssm-ecs-exec
exec into ECS containers!

## Usage:
(This tool assumes that you have granted your ecs task roles access to SSM and you have a valid AWS profile to access those task roles)

```
./ssm-ecs-exec.sh <cluster name> <service name>
```
This connects you to a task ID that is found with the first bit of code. NOTE:this will not always connect you to the same container.
