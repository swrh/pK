#!/bin/sh -ex

ant
unzip dist/pK.war -d dist/pK/
rsync -av --progress --delete dist/pK/ pk_dasho2_com@pk.dasho2.com:appservers/apache-tomcat-6x/webapps/ROOT/
