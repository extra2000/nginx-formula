# Changelog

### [2.0.1](https://github.com/extra2000/nginx-formula/compare/v2.0.0...v2.0.1) (2021-05-06)


### Fixes

* **defaults.yaml, pillar.example:** Use `cni-podman1` instead of `cni-podman0` to prevent conflicts with rootless containers ([d3ccf64](https://github.com/extra2000/nginx-formula/commit/d3ccf64c10b78c33b77b0a1cb06d471827203feb))

## [2.0.0](https://github.com/extra2000/nginx-formula/compare/v1.0.1...v2.0.0) (2021-03-14)


### ⚠ BREAKING CHANGES

* NGINX deployment is now using Podman container.

### Features

* Revamp into Podman container ([a89254a](https://github.com/extra2000/nginx-formula/commit/a89254a393b14ca675e767d6ef828995c8036eb0))


### Documentations

* **README:** Update `README.md` ([0ee4818](https://github.com/extra2000/nginx-formula/commit/0ee4818ccafc6662b43fed4f2dec163301451fe5))

### [1.0.1](https://github.com/extra2000/nginx-formula/compare/v1.0.0...v1.0.1) (2021-03-05)


### Fixes

* **selinux:** Fix permission denied when forwarding port `5601` ([0ed9b6e](https://github.com/extra2000/nginx-formula/commit/0ed9b6eafe232e794aa66b266ee01ca16c5647f3))

## 1.0.0 (2021-03-01)


### Features

* **salt:** Add implementations for `nginx/` states ([4d1c558](https://github.com/extra2000/nginx-formula/commit/4d1c558b96900411a9b3c50e09baa92ae5497a4c))


### Continuous Integrations

* Add AppVeyor with `semantic-release` bot ([53526c7](https://github.com/extra2000/nginx-formula/commit/53526c754a0480fdf8ffa42fdd0350b90d50f89f))


### Documentations

* **pillar:** Add `pillar.example` ([4906e0e](https://github.com/extra2000/nginx-formula/commit/4906e0ee89a1147e30ed4f3ca831934aa25344c4))
* **README:** Update `README.md` ([9dfd43c](https://github.com/extra2000/nginx-formula/commit/9dfd43cb4aa83bf82f172c8859173e3b17fc9c6f))
