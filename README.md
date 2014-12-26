This project defines a very simple application that can be spun up
in a docker container.

To build the image:

    sudo docker build -t="node-app"

Run thusly:

    sudo docker run -d -p 8666:8666 --name my-app node-app

After uploading to the docker repo, we can create ECS definitions to allow running
the container as a task in the ESC cluster.

		aws ecs register-task-definition --family box-endpoints --container-definitions file://./ecs-task.json

Start the task in the cluster via

		aws ecs run-task --cluster default --task-definition box-endpoints:1 --count 1

Verify the endpoint:

		curl http://ec2-54-173-171-3.compute-1.amazonaws.com/boxen

Integrating with box is super simple. Basically follow the instructions documented on
this page: https://developers.box.com/box-web-application-integrations/ -- look
as the 4 screen capture files (PNGs) in this directory for specifics of the 
configuration.

This application just logs the call, so to see the log output connect to the cluster member
running the task and use docker logs, e.g.

	[ec2-user@ip-10-0-0-39 ~]$ docker logs 8f9b1a4da9b3
Listening on 8666
{}
{}
{}
{}
{}
{ p0: 'default value 0',
  p1: 'default value 1',
  user: '228775681',
  fileid: '24343819359',
  filename: 'README.md' }




Troubleshooting hints:

* Log into the cluster instance. Run `docker events` to see if the run task
dies or not.
* View details in the logs in /var/logs/ecs
* Task dies and runs ok when launched from docker? Try adding more MiB
