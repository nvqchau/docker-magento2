#!/bin/bash

php -d memory_limit=-1 bin/magento maintenance:enable
php -d memory_limit=-1 bin/magento setup:upgrade
php -d memory_limit=-1 bin/magento setup:di:compile
php -d memory_limit=-1 bin/magento setup:static-content:deploy --area=adminhtml --force
php -d memory_limit=-1 bin/magento setup:static-content:deploy --area=frontend --force
php -d memory_limit=-1 bin/magento indexer:reindex
php -d memory_limit=-1 bin/magento cache:flush
php -d memory_limit=-1 bin/magento maintenance:disable
