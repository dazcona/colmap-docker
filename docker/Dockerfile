# https://colmap.github.io/install.html
# https://github.com/Kai-46/colmap_in_docker

# Recommended dependencies: CUDA (at least version 7.X)
FROM nvidia/cuda:8.0-devel-ubuntu16.04

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    vim

RUN apt-get update && apt-get install -y \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-test-dev \
    libeigen3-dev \
    libsuitesparse-dev \
    libfreeimage-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libglew-dev

RUN apt-get update && apt-get install -y \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libcgal-qt5-dev

RUN mkdir /tools

# Install ceres-solver
WORKDIR /tools
RUN apt-get update && apt-get install -y libatlas-base-dev libsuitesparse-dev
RUN git clone https://ceres-solver.googlesource.com/ceres-solver
WORKDIR /tools/ceres-solver
RUN git checkout $(git describe --tags)
RUN mkdir build
WORKDIR /tools/ceres-solver/build
RUN cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF
RUN make -j4 && make install

# Install OpenCV
WORKDIR /tools
RUN apt-get update && apt-get install -y build-essential libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN git clone https://github.com/opencv/opencv.git
RUN git clone https://github.com/opencv/opencv_contrib.git
WORKDIR /tools/opencv
RUN mkdir build
WORKDIR /tools/opencv/build
RUN cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
RUN make -j4 && make install

# Install colmap
# WORKDIR /tools
# RUN git clone https://github.com/colmap/colmap.git
RUN mkdir -p /tools/colmap/
ADD insight/ /tools/colmap
WORKDIR /tools/colmap
RUN git checkout dev
RUN mkdir build
WORKDIR /tools/colmap/build
RUN cmake ..
RUN make -j4 && make install

# Remove unneeded files
RUN rm -rf /tools

# # RUN mkdir /home
# RUN chmod -R 777 /home
# ENV HOME /home
# WORKDIR /home
 WORKDIR /code