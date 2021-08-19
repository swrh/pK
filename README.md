# perspeKtiva

### Database configuration

Open the `src/main/resources/hibernate.properties` file and change the following lines accordingly:

    hibernate.connection.url = jdbc:mysql://hostname/database
    hibernate.connection.username = username
    hibernate.connection.password = password

### Building

    $ ./mvnw package

### Running

    $ ./mvnw jetty:run

You could also run it in a Tomcat Apache server by first building it, getting the WAR file from the `target` directory
and moving it to the `webapps` directory of the server.

### Setting it up easily (the quick, dirty and insecure way)

    $ docker run --name pk-mysql -p 3306:3306 -d \
        -e MYSQL_ROOT_PASSWORD="password" \
        -e MYSQL_ROOT_HOST=% \
        -e MYSQL_DATABASE=dbname \
        mysql/mysql-server
    $ ./mvnw jetty:run

Open the browser at http://localhost:8080, try to log in with any email and password, stop the Jetty server (CTRL-C) and
run:

    $ mysql -h 127.0.0.1 -u root -ppassword dbname \
        -e 'insert into Employee (email,password,creationDate,modificationDate) values ("my@email.com","mypass",0,0);'
    $ ./mvnw jetty:run

Open the browser at the same link again and try to log with _my@email.com_ and _mypass_.
