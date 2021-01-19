FROM docker:19.03.8

ENV PYTHONWARNINGS="ignore::DeprecationWarning"

RUN apk add --no-cache \
    git \
    make \
    py-pip \
    python-dev \
    libffi-dev \
    openssl-dev \
    gcc \
    libc-dev \
    bash \
    gettext \
    curl \
    wget \
    zip \
    diffutils
RUN pip install "pytest<5"
RUN pip install awsebcli "pyrsistent==0.16.0"
RUN pip install "docker-compose"

RUN mkdir /root/.ssh && ssh-keyscan -t rsa gitlab.com >> /root/.ssh/known_hosts

COPY config /root/.ssh/config
COPY docker-compose /usr/bin/docker-compose
COPY docker-ci-entrypoint.sh /usr/bin/docker-ci-entrypoint.sh

ENTRYPOINT ["docker-ci-entrypoint.sh"]
