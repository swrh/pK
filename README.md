# pK

## Development

First you need to download Node and NPM using Maven and install the dependencies:

    $ ./mvnw frontend:install-node-and-npm
    $ ./mvnw frontend:npm

Then you can launch the frontend building scripts (I usually call it from the Code terminal):

    $ ./node/npm run-script watch

Then you launch the backend server (I do it from IntelliJ):

    $ ./mvnw spring-boot:run

And finally you can see the application running when opening the http://localhost:8080 URL from a web browser.
