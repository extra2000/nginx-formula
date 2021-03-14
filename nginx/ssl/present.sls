# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

openssl:
  pkg.installed

nginx-ssl-generate:
  cmd.run:
    - name: openssl req -x509 -newkey rsa:4096 -keyout private/server.key -out server.crt -days {{ NGINX.ssl.days_valid }} -nodes -config /opt/nginx/ssl/ssl.conf
    - cwd: /opt/nginx/ssl
    - runas: {{ NGINX.hostuser.name }}

{% if NGINX.dhparam.enabled %}
nginx-dhparm-present:
  cmd.run:
    - name: openssl dhparam -out /opt/nginx/ssl/private/dhparam.pem {{ NGINX.dhparam.bits }}
    - runas: {{ NGINX.hostuser.name }}
{% endif %}
