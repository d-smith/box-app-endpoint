This project defines a very simple application that can be spun up
in a docker container.

To build the image:

    sudo docker build -t="node-app"

Run thusly:

    sudo docker run -d -p 8666:8666 --name my-app node-app
