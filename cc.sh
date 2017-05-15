#!/bin/bash
./app/console cache:clear
./app/console cache:clear --env=prod

sudo chmod -R 777 ./app/cache/ ./app/logs/

