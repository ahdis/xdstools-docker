# NIST XDS Toolkit in a docker container

[NIST](https://www.nist.gov/) supports the [IHE](https://www.ihe.net/) effort in Document Sharing as part of the IT Infrastructure Domain with [testing, tools, and technical](https://ihexds.nist.gov/). Here are just instructions to use the NIST [XDS Toolkit](https://github.com/usnistgov/iheos-toolkit2/releases) in a [docker](https://www.docker.com/) container.

# Run XDS Toolkit with release 6.2.0 from github

If you have bash you can directly run docker (thanks [@ericpoiseau](https://twitter.com/ericpoiseau) for the script) with the version 6.2.0 from github
(maybe first chmod +x ./run-xdstools.bash):
```
./run-xdstools.bash
```
XDS Toolkit can be accessed in the browser: http://localhost:8080/xdstools6/

## Build XDS Toolkit from source
```
git clone https://github.com/usnistgov/iheos-toolkit2.git
(or git pull origin master if already downloaded)
cd iheos-toolkit2
mvn clean install -Dbuild.profile.id=Release
```
If you have a problem with resolving the dependencies on maven due to certificates ([ERROR] Failed to execute goal on project utilities: Could not resolve dependencies for project gov.nist.toolkit:utilities:jar:5.2.3))
follow the steps as described on the [iheos-toolkit2 help for gazelle_nexus](https://github.com/usnistgov/iheos-toolkit2/wiki/gazelle_nexus), on os x you can get JAVA_HOME with export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

Note: In iheos-toolkit2/tk-deps/src/main/Release.properties the path to the external cache and the port properties are set. Currently the path is fixed to /your/external/cache/location 

Then, copy `iheos-toolkit2/xdstools2/target/xdstools2-*.war` to this folder as `xdstools6.war`.


## Build & run XDS Toolkit in a docker container

Build the docker image:
```sh
docker build -t xdstools .

```
Run an instance:
```sh
docker run --rm -it -p 8080:8080 -p 8888:8888 -p 8443:8443 -v $PWD/cache:/your/external/cache/location xdstools
```

With this setup, xdstool's external cache will be saved in the `cache` directory. Due to how Docker works, the data in this folder will belong to the root user. This might cause some issues, e.g. when trying to access the files or when rebuilding the image. This can be solved by reclaiming ownership of the files:
```sh
sudo chown -R $USER:$(id -gn) cache/
```


