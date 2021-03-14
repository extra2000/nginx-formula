# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

nginx-image-present:
  cmd.run:
    - name: podman pull {{ NGINX.image.name }}
    - retry:
        attempts: 10
        interval: 5
        until: true
    - runas: {{ NGINX.hostuser.name }}

nginx-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - nginx.service.destroy

nginx-pod-running:
  cmd.run:
    {% if NGINX.host_network %}
    - name: podman play kube nginx-pod.yaml
    {% else %}
    - name: podman play kube --network=nginxnet nginx-pod.yaml
    {% endif %}
    - cwd: /opt/nginx
    - runas: {{ NGINX.hostuser.name }}
    - require:
      - cmd: nginx-image-present
      - module: nginx-pod-destroy-if-exists
