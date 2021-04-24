FROM fedora:latest
ADD repo/mongodb-org-4.4.repo /etc/yum.repos.d/
ADD init/testdb_create.sh /tmp/
RUN yum update -y && \
    chmod +x /tmp/testdb_create.sh && \
    mkdir -p /data/mongo/db && \
    mkdir -p /data/mongo/logs && \
    mkdir -p /data/db && \
    echo 'defaultyes=True' >> /etc/dnf/dnf.conf && \
    yum install -y mongodb-org mongodb-org-tools mongodb-org-shell wget net-tools && \
    wget https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json -P /tmp && \
    chown -R mongod:mongod /data && \
    sed -i '/dbPath/s/:.*/: \/data\/mongo\/db/' /etc/mongod.conf && \
    sed -i '/path/s/:.*/: \/data\/mongo\/logs\/mongod.log/' /etc/mongod.conf && \
    sed -i "s,\\(^[[:blank:]]*bindIp:\\) .*,\\1 0.0.0.0," /etc/mongod.conf  


CMD ["mongod"]
VOLUME ["/data"]
EXPOSE 27017
    
