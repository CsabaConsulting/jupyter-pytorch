# NOTE: Change this version in case of incompatibility issues
#       Reference https://quay.io/repository/jupyter/pytorch-notebook?tab=tags
#       And https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html
FROM quay.io/jupyter/pytorch-notebook:cuda12-2025-08-18
# Switch to root to perform system operations, e.g. apt install any extra dependencies
USER root

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
RUN dpkg -i cuda-keyring_1.1-1_all.deb
RUN rm cuda-keyring_1.1-1_all.deb
RUN apt update
RUN apt install -y cuda-toolkit-12-8

# Switch back to regular user before runtime
USER ${NB_UID}
WORKDIR /home/jovyan
EXPOSE 8888

