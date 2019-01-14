# deeplearning-fastai

Docker image supporting fastai, pytorch, tensorflow, jupyter, and anaconda.

The main purpose of this repository is to be able to pull an run this image
from a variety of environments, including AWS, GCP, and my home computer.

This image is published to DockerHub as `dennisobrien/deeplearning-fastai`.

## Host Requirements

It is assumed that it is running on a host that has a few things already 
installed and enabled.

- nvidia drivers
- CUDA 9.0, 9.2, 10.0
- nvidia-docker

## Docker commands

### Run

First set the current directory to the location of your notebooks you want to serve.
Then start the docker container.

`$ docker run -it --publish 8888:8888 --publish 6006:6006 \
    -v ${PWD}:/home/jovyan/workspace \
    -v ${HOME}/.fastai:/home/jovyan/.fastai \
    dennisobrien/deeplearning-fastai:latest \
    start-notebook.sh --notebook-dir=/home/jovyan/workspace`

A little explanation of these parameters.

- We are opening a few ports.
    - 8888 for Jupyter
    - 6006 for TensorBoard
- We are mounting a few volumes.
    - `~/workspace` in the container will be mapped to the current directory in the host.
    - `~/.fastai` in the container will be mapped to `~/.fastai` in the host.
- We instruct Jupyter to use `~/workspace` as the root of the notebook directory.


### Build

This image is built by DockerHub so it is not necessary to build it locally.
But if you need to for whatever reason, use this command:

`$ docker build -t dennisobrien/deeplearning-fastai:latest .`

### Push to DockerHub

This step is not necessary since the image is built automatically after a push to the
GitHub repository.

`$ docker push dennisobrien/deeplearning-fastai:latest`

