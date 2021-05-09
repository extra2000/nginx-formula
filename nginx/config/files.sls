# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

/opt/nginx/ssl/private:
  file.directory:
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - makedirs: true

{% if not NGINX.host_network %}
/home/{{ NGINX.hostuser.name }}/.config/cni/net.d:
  file.directory:
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - makedirs: true

/home/{{ NGINX.hostuser.name }}/.config/cni/net.d/podman-network-nginxnet.conflist:
  file.managed:
    - source: salt://nginx/files/podman-network-nginxnet.conflist.jinja
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - template: jinja
    - context:
      pod: {{ NGINX.pod }}
{% endif %}

/opt/nginx/ssl/ssl.conf:
  file.managed:
    - source: salt://nginx/files/ssl.conf.jinja
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - template: jinja
    - context:
      ssl: {{ NGINX.ssl }}

/opt/nginx/conf.d:
  file.recurse:
    - source: salt://nginx/files/conf.d
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - show_changes: false
    - file_mode: keep

/opt/nginx/ssl/ssl-params.conf:
  file.managed:
    - source: salt://nginx/files/ssl-params.conf.jinja
    - template: jinja
    - context:
      dhparam: {{ NGINX.dhparam }}

/opt/nginx/nginx-pod.yaml:
  file.managed:
    - source: salt://nginx/files/nginx-pod.yaml.jinja
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - template: jinja
    - context:
      nginx: {{ NGINX }}
