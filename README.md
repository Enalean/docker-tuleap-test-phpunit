Docker image to execute Tuleap PHPUnit tests
============================================

How to use
==========

To execute all tests, just type:

    $> docker run --rm -v $PWD:/tuleap enalean/tuleap-test-phpunit

Continuous integration usage
----------------------------

For jenkins builds:

    $> docker run --rm -v $WORKSPACE/tuleap:/tuleap -v $WORKSPACE:/output enalean/tuleap-test-phpunit --ci
