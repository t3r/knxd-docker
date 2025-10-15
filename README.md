# knxd Docker Image

A Docker wrapper for [knxd](https://github.com/knxd/knxd), the KNX daemon for Linux.

Available on Docker Hub: [torstend/knxd](https://hub.docker.com/r/torstend/knxd)

Github repository: [t3r/knxd-docker](https://github.com/t3r/knxd-docker)


## Overview

This Docker image provides a containerized version of knxd, allowing you to run the KNX daemon in a Docker environment. The image uses an entrypoint that accepts standard knxd command line arguments.

## Usage

```bash
docker run -it --rm torstend/knxd [knxd arguments]
```

### Configuration

The `knxd.ini` configuration file is **not included** in the Docker image and must be supplied as a command line argument:

```bash
docker run -it --rm -v /path/to/your/knxd.ini:/config/knxd.ini torstend/knxd /config/knxd.ini [other arguments]
```

### Example

```bash
# Mount your config file and run knxd
docker run -it --rm \
  -v ./knxd.ini:/config/knxd.ini \
  torstend/knxd /config/knxd.ini --listen-tcp=3671
```

## About knxd

knxd is a KNX daemon that provides access to the KNX bus. For more information, documentation, and source code, visit the [knxd repository](https://github.com/knxd/knxd).

## License

See [LICENSE](LICENSE) file for details.