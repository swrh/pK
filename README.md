USAGE
=====

To build the WAR file using Ant:

    $ ant archive

And the WAR file will be located under "dist/pK.war". To deploy it usually you
just need to drop it under the "webapps" folder of the Apache Tomcat
installation directory.

After that you need to setup the MySQL database. You need to install it using
your system instructions, create an user with a password and a database:

    mysql> create database dbname;
    mysql> create user 'username'@'localhost' identified by 'password';
    mysql> grant all privileges on dbname.* to 'username'@'localhost';
    mysql> flush privileges;

Add those settings to the "src/hibernate.properties" file like this:

    hibernate.connection.url = jdbc:mysql://localhost/dbname
    hibernate.connection.username = username
    hibernate.connection.password = password

You'll also need to uncomment the following line to create all needed tables
into your database in the first time you run.

    hibernate.hbm2ddl.auto = update

Just uncomment it, start the server, try to login once, comment it back and
then restart the server.

After that you're good to go! ;)

UBUNTU 12.04 HOWTO
==================

    $ sudo apt-get install tomcat6 openjdk-6-jdk mysql-server ant
    $ mysql -u root -p
    mysql> create database dbname;
    mysql> create user 'username'@'localhost' identified by 'password';
    mysql> grant all privileges on dbname.* to 'username'@'localhost';
    mysql> flush privileges;
    $ vi src/hibernate.properties

Set the following lines:

    hibernate.connection.url = jdbc:mysql://localhost/dbname
    hibernate.connection.username = username
    hibernate.connection.password = password
    hibernate.hbm2ddl.auto = update

... and then run:

    $ ant archive
    $ sudo install -o tomcat6 -g tomcat6 dist/pK.war /var/lib/tomcat6/webapps/pK.war

Go to http://localhost:8080/pK and try to log into the server once. It
shouldn't return a server failure, but just a wrong user/password error
message.

    $ mysql -u username -p dbname
    Enter password: password
    mysql> insert into Employee (email, password, creationDate, modificationDate) values('my@email.com', 'mypass', 0, 0);
    $ vi src/hibernate.properties

Comment out the following line:

    #hibernate.hbm2ddl.auto = update

... and then run:

    $ ant archive
    $ sudo install -o tomcat6 -g tomcat6 dist/pK.war /var/lib/tomcat6/webapps/pK.war
    $ sudo service tomcat6 restart

UBUNTU 16.04 HOWTO
==================

    $ sudo apt-get install tomcat8 openjdk-8-jdk mysql-server ant
    $ mysql -u root -p
    mysql> create database dbname;
    mysql> create user 'username'@'localhost' identified by 'password';
    mysql> grant all privileges on dbname.* to 'username'@'localhost';
    mysql> flush privileges;
    $ vi src/hibernate.properties

Set the following lines:

    hibernate.connection.url = jdbc:mysql://localhost/dbname
    hibernate.connection.username = username
    hibernate.connection.password = password
    hibernate.hbm2ddl.auto = update

... and then run:

    $ ant archive
    $ sudo install -o tomcat8 -g tomcat8 dist/pK.war /var/lib/tomcat8/webapps/pK.war

Go to http://localhost:8080/pK and try to log into the server once. It
shouldn't return a server failure, but just a wrong user/password error
message.

    $ mysql -u username -p dbname
    Enter password: password
    mysql> insert into Employee (email, password, creationDate, modificationDate) values('my@email.com', 'mypass', 0, 0);
    $ vi src/hibernate.properties

Comment out the following line:

    #hibernate.hbm2ddl.auto = update

... and then run:

    $ ant archive
    $ sudo install -o tomcat8 -g tomcat8 dist/pK.war /var/lib/tomcat8/webapps/pK.war
    $ sudo service tomcat8 restart
