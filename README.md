# flnpw/terraform

This repo has terraform installed for using on multilayer builds, as a installer or
as is.

## How to use

Using this image in a multilayered Dockerfile and fetching terraform from it:
```
FROM flnpw/terraform AS terraform
...
FROM myimage
...
COPY --from=terraform /usr/local/bin/terraform /<wherever>/terraform
...
```

Using this image as a local installer:
```
docker run --rm -ti \
  --entrypoint='' \
  -v /usr/local/bin:/target \
  flnpw/terraform \
  cp /usr/local/bin/terraform /target
```
