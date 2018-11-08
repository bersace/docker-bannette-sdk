FROM python:3.6

RUN set -eux; \
    apt-get update -y ; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        make \
        libicu-dev \
        rsync \
    ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ; \
    :

RUN set -eux ; \
    pip --no-cache-dir install \
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
    ; \
    :
