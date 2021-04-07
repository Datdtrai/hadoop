docker network create --subnet=172.16.0.0/16 hadoop-network &>/dev/null 
docker run --rm -it -d --add-host hadoop1:172.16.0.2  --add-host hadoop2:172.16.0.3 --add-host hadoop3:172.16.0.4 --net hadoop-network --ip 172.16.0.2 --name hadoop1 -p 50070:50070 -p 8088:8088 datdtrai2609/hadoop:v1
docker run --rm -it -d --add-host hadoop1:172.16.0.2  --add-host hadoop2:172.16.0.3 --add-host hadoop3:172.16.0.4 --net hadoop-network --ip 172.16.0.3 --name hadoop2 datdtrai2609/hadoop:v1
docker run --rm -it -d --add-host hadoop1:172.16.0.2  --add-host hadoop2:172.16.0.3 --add-host hadoop3:172.16.0.4 --net hadoop-network --ip 172.16.0.4 --name hadoop3 datdtrai2609/hadoop:v1

docker exec -it hadoop1 bash -c "hdfs namenode -format ; bash"
