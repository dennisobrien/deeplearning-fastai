# deeplearning-fastai

Docker image supporting fastai, pytorch, tensorflow, jupyter, and anaconda.

The main purpose of this repository is to be able to pull an run this image
from a variety of environments, including AWS, GCP, and my home computer.

## Host Requirements

It is assumed that it is running on a host that has a few things already 
installed and enabled.

- nvidia drivers
- CUDA 9.0, 9.2, 10.0
- nvidia-docker

## Docker commands

### Build

`$ docker build -t dennisobrien/deeplearning-fastai:latest .`

### Run

`$ docker run -it --publish 8888:8888 --publish 6006:6006 dennisobrien/deeplearning-fastai:latest`
