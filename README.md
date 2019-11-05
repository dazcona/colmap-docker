# Dockerized COLMAP 

Dockerfile to create a Docker container with the [COLMAP](https://github.com/colmap/colmap) executables.

The container is built from a CUDA image, and therefore requires both the [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) plugin and a [CUDA supported graphics card](http://www.geforce.com/hardware/technology/cuda/supported-gpus). To use it.

You must mount a volume to the container using the `-v` flag in order to provide input images to COLMAP as well as to access the output. In the example above, the `$PROJECT_PATH` environment variable should be set to point to a directory on your host computer containing your project files.

See the [COLMAP documentation](https://colmap.github.io) for instructions on how to use the COLMAP executables.

## Technologies

* [Colmap](https://colmap.github.io)

## Deployment

make build

make run

➜  docker git:(master) ✗ xhost +
access control disabled, clients can connect from any host

make dev

$ echo $DISPLAY
unix:1

$ export DATASET_PATH="/code/projects/gerrard-hall/"
$ echo "$DATASET_PATH"
/code/projects/gerrard-hall/

$ colmap automatic_reconstructor -h

$ colmap automatic_reconstructor \
    --workspace_path $DATASET_PATH \
    --image_path $DATASET_PATH/images \
    --dense 1 \
    --use_gpu 1


## Resources

* Colmap's datasets: https://colmap.github.io/datasets.html
* Colmap Docker image: https://github.com/Kai-46/colmap_in_docker