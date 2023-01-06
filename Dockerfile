FROM centos:7

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum install -y epel-release \
    centos-release-scl && \
    yum -y install \
        make \
        git \
        rh-git218 \
        php82-php-cli \
        php82-php-xml \
        php82-php-mbstring \
        php82-php-pdo \
        php82-php-process \
        php82-php-zip \
        php82-php-sodium \
        php82-php-gd \
        php82-php-soap \
        php82-php-ldap \
        php82-php-intl \
        php82-php-mysqlnd \
        php82-php-ffi \
        php82-php-pecl-mailparse \
        php82-php-pecl-redis5 \
        php82-php-pecl-pcov \
        perl \
    && yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/php82/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
