# docker-flatpak-builder
Simple docker image to build flatpaks.


# Usage.

## Get the image and create a container.

Get the image from docker hub:

```bash
docker pull williamjmorenor/flatpak-builder
```

From the project directory run the image:

```bash
docker run --name flatpak-packaging -v $PWD:/home/packager:rw -ti williamjmorenor/flatpak-builder
```

The flakpat build is available:

```bash

packager@2d7de89d4b42:~$ flatpak --help
Usage:
  flatpak [OPTION?] COMMAND
[...]
packager@2d7de89d4b42:~$ whoami
packager
packager@2d7de89d4b42:~$ pwd
/home/packager
```

To finish the sesion in the container just type:

```bash
  exit
```

## Reuse the docker container.

To resue the same docker container run:

```bash
  docker start flatpak-packaging -i
```

## Update to the last image.

Remove old image and container:

```bash
  docker rm flatpak-packaging
  docker image rm williamjmorenor/flatpak-builder
```

Pull last image and recreate container:

```bash
  docker pull williamjmorenor/flatpak-builder
  docker run --name flatpak-packaging -v $PWD:/home/packager:rw -ti williamjmorenor/flatpak-builder
```
