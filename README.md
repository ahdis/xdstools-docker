# XDSTools4

## Steps
* Compile NIST xdstools4 from source
* Configure xdstools4 with eHealth Suisse Metadata
* Build & run xdstools4 instance in Docker

## Compile NIST xdstools4 from source
```sh
git clone https://github.com/usnistgov/iheos-toolkit2.git
cd iheos-toolkit2
mvn clean install
```

Then, copy `iheos-toolkit2/xdstools2/target/xdstools2-*.war` to this folder as `xdstools4.war`.

## Configure xdstools4 with eHealth Suisse Metadata
TODO

## Build & run xdstools4 instance in Docker

Build the Docker image:
```sh
docker build -t xdstools .
```

Run an instance:
```sh
docker run --rm -it -p 8080:8080 -p 8888:8888 -p 8443:8443 -v $PWD/cache:/Users/bill/tmp/toolkit2a/ xdstools
```

With this setup, xdstool4's external cache will be saved in the `cache` directory. Due to how Docker works, the data in this folder will belong to the root user. This might cause some issues, e.g. when trying to access the files or when rebuilding the image. This can be solved by reclaiming ownership of the files:
```sh
sudo chown -R $USER:$(id -gn) cache/
```

Then, xdstools4 can be accessed in the browser: http://localhost:8080/xdstools4/
