# drone-rocketchat

This is a drone plugin that allows you to notify to Rocketchat from your drone build.

### Usage

You will need a rocketchat webhook for this plugin to work. Please set it as a drone secret.

#### Example .drone.yml

```yaml
---
kind: pipeline
name: example-pipeline
type: kubernetes
platform:
  os: linux
  arch: amd64

steps:

- name: Step-1
  image: plugins/docker
  settings:
    registry: quay.io
    dockerfile: Dockerfile
    repo: <repo>
    tags:
    - latest
    - ${DRONE_COMMIT_SHA}
    - build-${DRONE_BUILD_NUMBER}
  environment:
    DOCKER_USERNAME:
      from_secret: docker_username
    DOCKER_PASSWORD:
      from_secret: docker_password
  when:
      event:
      - push
      branch:
      - master
---
kind: pipeline
name: notify
type: kubernetes

steps:
- name: rocketchat-webhook
  image: quay.io/ukhomeofficedigital/drone-rocketchat:latest
  pull: always
  settings:
    webhook: 
      from_secret: dev_webhook

depends_on:
- default

trigger:
  status:
  - failure
  - success

services:
- name: docker
  image: 340268328991.dkr.ecr.eu-west-2.amazonaws.com/acp/dind
```

#### Example Output

```
UKHomeOffice/drone-rocketchat @rocket.cat Bot 12:35 PM
Build Number #132 success 
Commit Author: Test User
Branch: main
Commit Message: added drone file
https://drone-gh.acp.homeoffice.gov.uk/UKHomeOffice/drone-rocketchat/132
```

### Environment Reference

[https://docs.drone.io/reference/environ/](https://docs.drone.io/reference/environ/)
