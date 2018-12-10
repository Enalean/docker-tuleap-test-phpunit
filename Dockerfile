FROM centos:6

COPY centos-vault-rh-php56.repo /etc/yum.repos.d/
COPY remi-safe.repo /etc/yum.repos.d/
COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/

RUN yum install -y epel-release centos-release-scl && \
    yum -y install \
        php56-php-cli \
        php56-php-xml \
        php56-php-pecl-xdebug \
        php56-php-mbstring \
        php56-php-pdo \
        php56-php-process \
        php56-php-gd \
        php56-php-pecl-mailparse \
        && \
    yum clean all

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
