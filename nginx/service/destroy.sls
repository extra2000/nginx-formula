# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

nginx-pod-destroy:
  cmd.run:
    - name: podman pod rm --force nginx-pod
    - runas: {{ NGINX.hostuser.name }}
