FROM python:3.7

RUN set -eux; \
    curl -sL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - ; \
    echo deb http://deb.nodesource.com/node_11.x stretch main > /etc/apt/sources.list.d/nodesource.list; \
    apt-get update -y ; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libicu-dev \
        make \
        nodejs \
        rsync \
    ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ; \
    :

RUN python -m venv ~/.cache/venv/
ENV VIRTUAL_ENV /root/.cache/venv/
ENV PATH /root/.cache/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN pip --no-cache-dir install \
        aiosmtplib \
        asyncpg \
        bcrypt \
        black \
        clize \
        flake8 \
        poetry \
        pyicu \
        pytest \
        sanic \
        sanic_session \
    ;

RUN set -eux ; \
    npm install --global \
        @vue/cli \
        graphql@ \
    ;

