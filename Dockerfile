FROM centos:6

RUN yum install -y epel-release centos-release-scl && \
    yum -y install rh-php56-php-cli rh-php56-php-xml rh-php56-php-pecl-xdebug && \
    yum clean all && \
    /opt/rh/rh-php56/root/usr/bin/php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    /opt/rh/rh-php56/root/usr/bin/php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Composer Installer verified'; } else { echo 'Composer Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    /opt/rh/rh-php56/root/usr/bin/php composer-setup.php && \
    /opt/rh/rh-php56/root/usr/bin/php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

COPY composer.json /tmp/run/
RUN cd /tmp/run && /opt/rh/rh-php56/root/usr/bin/php /usr/local/bin/composer install

COPY run.sh /

ENTRYPOINT [ "/run.sh" ]

VOLUME ["/tuleap"]
