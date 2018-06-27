FROM tensorflow/tensorflow:1.5.1

# ENV variables for python3 - see http://click.pocoo.org/5/python3/
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Silence Tensorflow warnings: look into compiling for CPU supported instruction sets
ENV TF_CPP_MIN_LOG_LEVEL 2

# Update packages
RUN apt-get update && apt-get install -y git wget libpq-dev python3.5-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libssl-dev  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Get pip3
RUN wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py

# Clone g2p-seq2seq
RUN mkdir /g2p-seq2seq
RUN git clone https://github.com/cmusphinx/g2p-seq2seq.git /g2p-seq2seq
# Install g2p-seq2seq (if we don't navigate to the dir, installation fails)
RUN cd /g2p-seq2seq && \
    python setup.py install

# Fetch US dictionary
RUN mkdir /cmudict
RUN git clone https://github.com/cmusphinx/cmudict.git /cmudict

# Fetch model
RUN mkdir /g2p-seq2seq-model
COPY g2p-seq2seq-model-6.2-cmudict-nostress.tar.gz ./
RUN tar xf g2p-seq2seq-model-6.2-cmudict-nostress.tar.gz -C /g2p-seq2seq-model
RUN rm -rf g2p-seq2seq-model-6.2-cmudict-nostress.tar.gz

WORKDIR "/root"
CMD ["/bin/bash"]