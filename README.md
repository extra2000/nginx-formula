# nginx-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/5qsjkq143w4ndig7/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/nginx-formula/branch/master) |

SaltStack Formula for [NGINX](https://www.nginx.com/).


## Available states

| States | Descriptions |
| --- | --- |
| `nginx` | Configure NGINX and create self-signed certificate. |
| `nginx.service` | Deploy NGINX with the created self-signed certificate. |
