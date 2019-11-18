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
        php73-php-soap \
        php73-php-ldap \
        php73-php-pecl-mailparse \
        php73-php-pecl-redis \
        php73-php-pecl-pcov \
	perl \
	&& yum clean all && \
    echo 'pcov.enabled = 1' >> /etc/opt/remi/php73/php.d/40-pcov.ini

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
