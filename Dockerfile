# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM tomcat:9.0-jre8-alpine
RUN ["rm", "-fr", "/usr/local/tomcat/webapps/ROOT"]
COPY ./target/CasaDomotica-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
#Se crea la imagen
#sudo docker build -t casadomotica .  
#se ejecuta la imagen y se crea el contenedor 
#sudo docker run --name casadomotica -d -p 5025:8080 casadomotica 