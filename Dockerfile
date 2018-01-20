FROM ubuntu:latest
MAINTAINER Tim Taubert <tim@timtaubert.de>

RUN useradd -d /home/kremlin -s /bin/bash -m kremlin
WORKDIR /home/kremlin

# Install dependencies.
ADD setup.sh /tmp/setup.sh
RUN bash /tmp/setup.sh

# Change user.
USER kremlin
RUN mkdir /home/kremlin/bin

# Install dependencies.
ADD setup-user.sh /tmp/setup-user.sh
RUN bash /tmp/setup-user.sh

# Env variables.
ENV HOME /home/kremlin
ENV SHELL /bin/bash
ENV USER kremlin
ENV LOGNAME kremlin
ENV HOSTNAME kremlin
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOST localhost
ENV DOMSUF localdomain

# KreMLin and F* binaries.
ENV PATH "${PATH}:/home/kremlin/bin/fstar/bin:/home/kremlin/bin/kremlin"

# Set a default command for debugging.
CMD ["/bin/bash", "--login"]
