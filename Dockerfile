FROM ubuntu:trusty

RUN adduser --disabled-password --gecos '' pyenv

RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  git \
  libbz2-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  llvm \
  make \
  wget \
  xz-utils \
  zlib1g-dev

USER pyenv

RUN git clone https://github.com/yyuu/pyenv.git /home/pyenv/.pyenv

ENV HOME /home/pyenv
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

ARG PYTHON_VERSION=3.5.2

RUN pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION && pyenv rehash

CMD ["python"]
