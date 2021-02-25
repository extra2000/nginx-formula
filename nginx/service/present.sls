# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

# If NGINX is already installed, it have to be stop and then start again to apply configs
nginx-service-stop:
  service.dead:
    - name: nginx.service

nginx-service-running:
  service.running:
    - name: nginx.service
    - enable: true
