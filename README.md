## Smaller Java 9 apps in Docker

This project showcases what is in my opinion the coolest features in JDK 9:

 * ability to create custom runtime for your application
 * native support for Alpine Linux

This translates to less disk space and faster startup times than the full JVM. Whether or not it improves memory usage or speed after initial startup is an open question in my mind.

### TL; DR version

```
REPOSITORY=stevenacoffman/java9-bench
docker build -t "${REPOSITORY}:latest" .
docker run -it stevenacoffman/java9-bench
```

### Acknowledgments

+ Java web code and jlink flags comes from [vmj http-server](https://github.com/vmj/http-server)
+ Combining jlink with CDS is from [Matthew Gilliard's blog](http://mjg123.github.io/2017/11/07/Java-modules-and-jlink.html)

### Run the container image

Running the container is old news:

```
  docker run stevenacoffman/java9-bench
```
