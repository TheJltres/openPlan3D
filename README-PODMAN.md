# OpenPlan3D with Podman

This bundle adds a production Dockerfile and Compose file to the
`laanlabs/openPlan3D` repository.

## Run

Clone the upstream repository:

    git clone https://github.com/laanlabs/openPlan3D.git
    cd openPlan3D

Copy `Dockerfile`, `compose.yaml`, and `.dockerignore` into the repository,
then run:

    podman compose up -d --build

Open:

    http://localhost:8080

Stop it:

    podman compose down

`podman compose` uses a Compose provider such as `podman-compose`; Podman
documents this as the supported wrapper for Compose workloads.

## Files

- `Dockerfile` - multi-stage Node 24 production image
- `compose.yaml` - exposes the app on host port 8080
- `.dockerignore` - keeps local/build files out of the image
