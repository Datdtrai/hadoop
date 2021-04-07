FROM ubuntu
MAINTAINER 18133006@student.hcmute.edu.vn
RUN apt update && apt install -y openssh-server openssh-client vim
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN sed -ri 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking accept-new/g' /etc/ssh/ssh_config
RUN chmod 0600 ~/.ssh/authorized_keys

RUN echo "root:123" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers

ADD jdk1.8 /usr/local/jdk1.8
ENV JAVA_HOME /usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH

ADD hadoop /usr/local/hadoop
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH

RUN mkdir /home/hadoop
RUN mkdir /home/hadoop/tmp /home/hadoop/hdfs_name /home/hadoop/hdfs_data

ADD configFile/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD configFile/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
ADD configFile/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD configFile/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
ADD configFile/slaves $HADOOP_HOME/etc/hadoop/slaves
RUN echo "export JAVA_HOME=/usr/local/jdk1.8" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN echo "export PATH=$PATH:$HADOOP_HOME/sbin" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
