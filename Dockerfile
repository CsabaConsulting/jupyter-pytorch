# NOTE: Change this version in case of incompatibility issues
#       Reference https://quay.io/repository/jupyter/pytorch-notebook?tab=tags
#       And https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html
FROM quay.io/jupyter/pytorch-notebook:cuda12-2025-08-18
# Switch to root to perform system operations, e.g. apt install any extra dependencies
USER root

RUN apt install -y nvidia-cuda-toolkit

# Switch back to regular user before runtime
USER ${NB_UID}
WORKDIR /home/jovyan
EXPOSE 8888

