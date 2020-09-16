docker build -t apachesample:v01 .
docker run -itd --name webserver -p 10080:80 apachesample:v01
Open Browser
Put url http://<<IP Address:10080>>
