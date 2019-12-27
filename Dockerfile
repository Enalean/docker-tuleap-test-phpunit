FROM centos:7

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum install -y epel-release \
    centos-release-scl && \
    yum -y install \
        make \
        git \
        sclo-git212-git \
        php74-php-cli \
        php74-php-xml \
        php74-php-mbstring \
        php74-php-pdo \
        php74-php-process \
        php74-php-zip \
        php74-php-sodium \
        php74-php-gd \
        php74-php-soap \
        php74-php-ldap \
        php74-php-intl \
        php74-php-pecl-mailparse \
        php74-php-pecl-redis \
        php74-php-pecl-pcov \
        perl \
    && yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/php74/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
