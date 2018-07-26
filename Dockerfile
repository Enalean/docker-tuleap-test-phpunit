FROM centos:6

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum -y install \
        php72-php-cli \
        php72-php-xml \
        php72-php-pecl-xdebug \
        php72-php-mbstring \
        php72-php-pdo \
        php72-php-process \
        php72-php-zip && \
    yum clean all

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
