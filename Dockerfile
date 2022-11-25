FROM centos:7

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum install -y epel-release \
    centos-release-scl && \
    yum -y install \
        make \
        git \
        rh-git218 \
        php81-php-cli \
        php81-php-xml \
        php81-php-mbstring \
        php81-php-pdo \
        php81-php-process \
        php81-php-zip \
        php81-php-sodium \
        php81-php-gd \
        php81-php-soap \
        php81-php-ldap \
        php81-php-intl \
        php81-php-mysqlnd \
        php81-php-ffi \
        php81-php-pecl-mailparse \
        php81-php-pecl-redis5 \
        php81-php-pecl-pcov \
        perl \
    && yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/php81/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
