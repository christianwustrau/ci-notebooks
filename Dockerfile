FROM jupyter/minimal-notebook

LABEL maintainer="Christian Wustrau <christian.wustrau@ovgu.de>"

USER root

# Install xeus-cling
RUN conda create -n cling
RUN echo "source activate env" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH
RUN conda install xeus-cling -c conda-forge

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

WORKDIR $HOME
