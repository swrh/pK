# pK

This project started as a real application used in 2011 but now is just a hobby for me. It is under constant modifications and is not safe to use in production. I'm constantly replacing frameworks it depends on, rewriting its structure, redesigning its user interface and even changing the languages in which it is written. It is pratically a sandbox for me to try new and different web technologies.

If you want to know more about the changes I've been doing, please take a look at the *History* section at the end of this document.

## Development

First you need to download Node and NPM using Maven and install the dependencies:

    $ ./mvnw frontend:install-node-and-npm
    $ ./mvnw frontend:npm

Then you can launch the frontend building scripts (I usually call it from the Code terminal):

    $ ./node/npm run-script watch

Then you launch the backend server (I do it from IntelliJ):

    $ ./mvnw spring-boot:run

And finally you can see the application running when opening the http://localhost:8080 URL from a web browser.

## History

In 2011 this project was written, released and deployed using Java, Struts and MySQL. The version released was 1.0 and the only language supported was Brazilian Portuguese. The code can be found tagged as v1.0.

In 2017 I started rewriting it using Ruby on Rails, but after sometime I deleted the unfinished code. It was in a different repository.

In mid 2021 I updated it using newer framework versions but it still has some big bugs. Its branch is named as release-1.1.

In late 2021 I decided to start rewriting it using newer technologies. The frontend will be written using React and in the backend I'm using Spring, but I'm not 100% satisfied with this decision and I might move to something else soon.
