FROM jupyter/scipy-notebook

# Fix for `conda activate ...`
USER root
RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

USER $NB_USER

# Enable 'conda activate' from the shell
#RUN sudo ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

RUN conda install --quiet --yes \
    tensorflow-gpu \
    keras \
    nb_conda_kernels && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN conda create --quiet --yes --name=fastai \
    --channel=fastai --channel=pytorch \
    python=3.7 ipykernel \
    pytorch \
    pytorch-nightly \
    cuda92 \
    fastai==1.0.39
