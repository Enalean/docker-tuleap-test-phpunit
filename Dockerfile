FROM centos:7

COPY remi-safe.repo /etc/yum.repos.d/

RUN yum install -y epel-release && \
    yum -y install \
        make \
        php73-php-cli \
        php73-php-xml \
        php73-php-mbstring \
        php73-php-pdo \
        php73-php-process \
        php73-php-zip \
        php73-php-sodium \
        php73-php-gd \
        php73-php-pecl-mailparse \
        php73-php-pecl-pcov && \
    yum clean all

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
