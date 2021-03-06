# Contributing to kubevirt/kubevirtci

Welcome! As stated in the [README](README.md) this repository contains code for the virtualized clusters used in testing KubeVirt.

See [the KubeVirt contribution guide](https://github.com/kubevirt/kubevirt/blob/master/CONTRIBUTING.md) for general information about how to contribute.

## Getting started with gocli

Prerequisites:
* python
* Bazel

Install Bazel according https://docs.bazel.build/versions/master/install.html
Change dir to gocli folder:
```
cd cluster-provision/gocli
```

Using local gocli images during development, and in order to test before publishing:
```
make container-run
export KUBEVIRTCI_GOCLI_CONTAINER=bazel:gocli
```

Publishing (after make container-run / make all)
```
make push
```

After published, update cluster-up/cluster/images.sh with the gocli hash, that was created by the push command.

