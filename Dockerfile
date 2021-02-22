FROM jupyter/minimal-notebook

LABEL maintainer="Christian Wustrau <christian.wustrau@ovgu.de>"

USER root

# Install IRuby
RUN apt-get update
RUN apt-get install -y libtool libffi-dev ruby ruby-dev make
RUN apt-get install -y libzmq3-dev libczmq-dev

RUN gem install ffi-rzmq
RUN gem install iruby --pre

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

RUN iruby register

WORKDIR $HOME
