FROM jupyter/minimal-notebook

LABEL maintainer="Christian Wustrau <christian.wustrau@ovgu.de>"

USER root

# Install IRuby
RUN apt-get update
RUN apt-get install -y build-essential ruby ruby-dev libzmq3 libzmq3-dev gnuplot-nox libgsl0-dev libtool autoconf automake zlib1g-dev libsqlite3-dev libmagick++-dev imagemagick libatlas-base-dev && apt-get clean
RUN ln -s /usr/bin/libtoolize /usr/bin/libtool # See https://github.com/zeromq/libzmq/issues/1385

RUN gem update --no-document --system && gem install --no-document sciruby-full

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

RUN iruby register

WORKDIR $HOME
