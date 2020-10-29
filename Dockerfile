FROM centos:7

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum install -y epel-release \
    centos-release-scl && \
    yum -y install \
        make \
        git \
        sclo-git212-git \
        rh-git218 \
        php80-php-cli \
        php80-php-xml \
        php80-php-mbstring \
        php80-php-pdo \
        php80-php-process \
        php80-php-zip \
        php80-php-sodium \
        php80-php-gd \
        php80-php-soap \
        php80-php-ldap \
        php80-php-intl \
        php80-php-mysqlnd \
        php80-php-pecl-mailparse \
        php80-php-pecl-redis5 \
        php80-php-pecl-pcov \
        perl \
    && yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/php80/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
