FROM centos:7

ARG PHP_BASE

COPY remi-safe.repo /etc/yum.repos.d/
COPY Tuleap.repo /etc/yum.repos.d/

RUN yum install -v -y epel-release && \
    yum -v -y install \
        make \
        tuleap-git-bin \
        openssh \
        ${PHP_BASE}-php-cli \
        ${PHP_BASE}-php-xml \
        ${PHP_BASE}-php-mbstring \
        ${PHP_BASE}-php-pdo \
        ${PHP_BASE}-php-process \
        ${PHP_BASE}-php-zip \
        ${PHP_BASE}-php-sodium \
        ${PHP_BASE}-php-gd \
        ${PHP_BASE}-php-soap \
        ${PHP_BASE}-php-ldap \
        ${PHP_BASE}-php-intl \
        ${PHP_BASE}-php-mysqlnd \
        ${PHP_BASE}-php-ffi \
        ${PHP_BASE}-php-pecl-mailparse \
        ${PHP_BASE}-php-pecl-redis5 \
        ${PHP_BASE}-php-pecl-pcov \
        perl \
    && yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/${PHP_BASE}/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
