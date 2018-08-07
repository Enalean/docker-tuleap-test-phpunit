FROM centos:6

COPY centos-vault-rh-php56.repo /etc/yum.repos.d/
COPY remi-safe.repo /etc/yum.repos.d/
COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/

RUN yum install -y epel-release centos-release-scl && \
    yum -y install \
        rh-php56-php-cli \
        rh-php56-php-xml \
        rh-php56-php-pecl-xdebug \
        rh-php56-php-mbstring \
        rh-php56-php-pdo \
        rh-php56-php-process \
        php56-php-cli \
        php56-php-xml \
        php56-php-pecl-xdebug \
        php56-php-mbstring \
        php56-php-pdo \
        php56-php-process \
        && \
    yum clean all

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
