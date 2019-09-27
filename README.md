# Sample
Sample is a simple web application for testing communication between multiple servers using the HTTP protocol.

## Tech Stack
Java Application using Spring Boot

Java Servlet Pages with JavaScript

in-mem h2 embbeded database

## Requirements
Oracle JDK 8 or JRE 8 and higher

Tomcat >= 8.0

## Installation
Maven is the build manager for this application.

To install dependencies and generate the Web Application Archive WAR file in ./target

In the project root directory (home of pom.xml) run

```bash
mvn install
```

or using the standalone plugin

```bash
./mvnw install
```
Output:


<PROJECT_ROOT>/target/sample-0.0.1.war

<PROJECT_ROOT>/target/ROOT.war
## Deployment
### For standard server deployment
copy ROOT.war to webapps/ in your tomcat server


### Using Docker Compose to spin up 3 application servers
```bash
docker-compose up
```
see docker-compose.yml for port numbers. Default: 8001, 8002, 8003


## Usage
Access http://localhost:8080/ or http://{your-server-ip}:{port-number}/

8080 is the default tomcat server port

## Configuration
/src/main/resources/application.yml



## License
[MIT](https://choosealicense.com/licenses/mit/)



