### What is that ??
- This is all file and direction to create and run a cluster hadoop with image docker has name image-hadoop, include:
  - Dockerfile 
  - ConfigFiles
  - Hadoop
  - Java
  - runall.sh
- Hadoop-2.7.7 is the version choosed


### How it work ??
 - The first, you must pull the hadoop image by command: docker pull datdtrai2609/hadoop:v1
 - The second, you download all file in master branch by command: wget https://github.com/Datdtrai/hadoop.git
 - The third, you find runall.sh file and you run it by command: ./runall.sh
 - Now, you was in master container of a hadoop cluster
 - Final, you start the hadoop cluster by command: start-all.sh (or start-dfs.sh and start-yarn.sh)
 - You can exit this container by command: 'exit' or use hot key 'Ctrl + P + Q'. So, if you want attach again any container, you can use attach, exec, ... or any service was support by docker, don't forget 'bash' in the end of command.
 * Note: the cluster has 1 name node (hadoop1) and 3 data node (hadoop1, hadoop2, hadoop3)
