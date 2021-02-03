ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Christian Wustrau <christian.wustrau@ovgu.de>"

USER root

# install additional package...
RUN pip install --no-cache-dir numpy \
	matplotlib \
	scipy \
	seaborn \
	pandas \
	deap \
	scikit-learn \
	ffmpeg \
	openpyxl \
	Pillow \
	nose \
	sympy
	
RUN pip install --no-cache-dir torch==1.7.1+cpu \
	torchvision==0.8.2+cpu \
	torchaudio==0.7.2 -f \
	https://download.pytorch.org/whl/torch_stable.html

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

WORKDIR $HOME