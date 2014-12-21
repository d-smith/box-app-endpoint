This project defines a very simple application that can be spun up
in a docker container.

To build the image:

    sudo docker build -t="node-app"

Run thusly:

    sudo docker run -d -p 8666:8666 --name my-app node-app

Troubleshooting hints:

* Log into the cluster instance. Run `docker events` to see if the run task
dies or not.
* View details in the logs in /var/logs/ecs
* Task dies and runs ok when launched from docker? Try adding more MiB
