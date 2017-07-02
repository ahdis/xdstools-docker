# XDSTools4

## Steps
* Download NIST xdstool4 WAR
* Configure xdstool4 with eHealth Suisse Metadata
* Build & run xdstools4 instance in Docker

## Download NIST xdstool4 WAR
Download the latest release from [usnistgov/iheos-toolkit2 on GitHub](https://github.com/usnistgov/iheos-toolkit2/releases), and save it in this folder as `xdstools4.war`.

## Configure xdstool4 with eHealth Suisse Metadata
TODO

## Build & run xdstools4 instance in Docker

Build the Docker image:
```sh
docker build -t xdstools .
```

Run an instance:
```sh
docker run --rm -it -p 8080:8080 -v $PWD/cache:/Users/bill/tmp/toolkit2/ xdstools
```

With this setup, xdstool4's external cache will be saved in the `cache` directory. Due to how Docker works, the data in this folder will belong to the root user. This might cause some issues, e.g. when trying to access the files or when rebuilding the image. This can be solved by reclaiming ownership of the files:
```sh
sudo chown -R $USER:$(id -gn) cache/
```

Then, xdstools4 can be accessed in the browser: http://localhost:8080/xdstools4/
