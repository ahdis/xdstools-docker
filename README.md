# XDSTools5

[XDSTools5](https://github.com/usnistgov/iheos-toolkit2/releases) from NIST in a docker instance

# Run NIST xdstools from github with latset release from github

If you have bash you can directly run docker (thanks [@ericpoiseau](https://twitter.com/ericpoiseau) for the script) with the version 5.2.3 from github
(maybe first chmod +x ./run-xdstools.bash):
```
./run-xdstools.bash
```
Then, xdstools5 can be accessed in the browser: http://localhost:8080/xdstools5/

## Compile NIST xdstools5 from source
```
git clone https://github.com/usnistgov/iheos-toolkit2.git
(or git pull origin master if already downloaded)
cd iheos-toolkit2
mvn clean install -Dbuild.profile.id=Release
```
If you have a problem with resolving the dependencies on maven due to certificates ([ERROR] Failed to execute goal on project utilities: Could not resolve dependencies for project gov.nist.toolkit:utilities:jar:5.2.3))
follow the steps as described on the [iheos-toolkit2 help for gazelle_nexus](https://github.com/usnistgov/iheos-toolkit2/wiki/gazelle_nexus), on os x you can get JAVA_HOME with export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

Note: In iheos-toolkit2/tk-deps/src/main/Release.properties the path to the external cache and the port properties are set. Currently the path is fixed to /your/external/cache/location 

Then, copy `iheos-toolkit2/xdstools2/target/xdstools2-*.war` to this folder as `xdstools5.war`.


## Build & run xdstools5 instance in Docker

Build the Docker image:
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


