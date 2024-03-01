 FROM continuumio/miniconda3:latest

 RUN apt-get update && \
     apt-get  install --no-install-recommends -y wget bash build-essential gcc && \
     apt-get clean && rm -rf /var/lib/apt/lists/*

 ADD . /root/legacy_data/

 RUN conda --version

 RUN conda create -y --name bread python=3.8

 RUN conda run -n bread pip install -r /root/legacy_data/requirements.txt

 #installing libhl1 library
 # RUN apt-get install libgl1-mesa-glx

 RUN apt-get update || echo "Error occured!"
 # RUN apt install vim

 # RUN conda run -n lcdpnet conda install -c conda-forge unzip
 RUN conda init bash
 RUN echo "conda activate bread" >> ~/.bashrc

 RUN echo "Complete!"

