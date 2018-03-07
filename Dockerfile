FROM centos:6

RUN yum install -y epel-release centos-release-scl && \
    yum -y install rh-php56-php-cli rh-php56-php-xml rh-php56-php-pecl-xdebug rh-php56-php-mbstring rh-php56-php-pdo && \
    yum clean all

CMD [ "make", "-C", "/tuleap", "phpunit-run-as-owner" ]

VOLUME ["/tuleap"]
