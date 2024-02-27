FROM centos:7

COPY remi-safe.repo /etc/yum.repos.d/
COPY Tuleap.repo /etc/yum.repos.d/

RUN yum install -v -y epel-release && \
    yum -v -y install \
        make \
        tuleap-git-bin \
        openssh \
        php83-php-cli \
        php83-php-xml \
        php83-php-mbstring \
        php83-php-pdo \
        php83-php-process \
        php83-php-zip \
        php83-php-sodium \
        php83-php-gd \
        php83-php-soap \
        php83-php-ldap \
        php83-php-intl \
        php83-php-mysqlnd \
        php83-php-ffi \
        php83-php-pecl-mailparse \
        php83-php-pecl-redis5 \
        php83-php-pecl-pcov \
        perl \
    && yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/php83/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
