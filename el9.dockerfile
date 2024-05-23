FROM rockylinux:9

ARG PHP_BASE

COPY Tuleap.repo /etc/yum.repos.d/

RUN dnf install -v -y epel-release https://rpms.remirepo.net/enterprise/remi-release-9.rpm && \
    dnf -v -y install \
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
        ${PHP_BASE}-php-ldap \
        ${PHP_BASE}-php-intl \
        ${PHP_BASE}-php-mysqlnd \
        ${PHP_BASE}-php-ffi \
        ${PHP_BASE}-php-pecl-mailparse \
        ${PHP_BASE}-php-pecl-redis5 \
        ${PHP_BASE}-php-pecl-pcov \
        perl \
        glibc-locale-source \
    && dnf clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/${PHP_BASE}/php.d/40-pcov.ini && \
    localedef -i fr_FR -c -f UTF-8 fr_FR.UTF-8 && \
    localedef -i en_US -c -f UTF-8 en_US.UTF-8 && \
    localedef -i en_GB -c -f UTF-8 en_GB.UTF-8

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
