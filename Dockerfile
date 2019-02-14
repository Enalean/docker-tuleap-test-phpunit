FROM centos:6

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum install -y epel-release && \
    yum -y install \
        make \
        php72-php-cli \
        php72-php-xml \
        php72-php-mbstring \
        php72-php-pdo \
        php72-php-process \
        php72-php-zip \
        php72-php-sodium \
        php72-php-gd \
        php72-php-pecl-mailparse \
        php72-php-pecl-pcov && \
    yum clean all

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
