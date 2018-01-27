# XDSTools5

[XDSTools5](https://github.com/usnistgov/iheos-toolkit2/releases) from NIST in a docker instance

## Compile NIST xdstools5 from source
```
git clone https://github.com/usnistgov/iheos-toolkit2.git
(or git pull origin master if already downloaded)
cd iheos-toolkit2
mvn clean install
```
Then, copy `iheos-toolkit2/xdstools2/target/xdstools2-*.war` to this folder as `xdstools5.war`.

## Configure xdstools with Swiss Metadata
TODO (see gazelle instance)

## Build & run xdstools5 instance in Docker

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

Then, xdstools5 can be accessed in the browser: http://localhost:8080/xdstools5/
