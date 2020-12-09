#!/bin/bash -e

exec "/usr/bin/supervisord" "-c" "/etc/supervisor/conf.d/supervisord.conf"