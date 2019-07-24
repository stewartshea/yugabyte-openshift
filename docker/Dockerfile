FROM yugabytedb/yugabyte:latest 

VOLUME ["/yugabyte-data"]

# Set permissions for OpenShift
RUN chgrp -R 0 /yugabyte-data && \
    chmod -R g=u /yugabyte-data

RUN chmod g=u /etc/passwd


COPY entrypoint.sh .

ENTRYPOINT ["/bin/bash", "-c" , "./entrypoint.sh"]



# FROM centos:7
# MAINTAINER YugaByte
# ENV container=yugabyte-db \
#     YB_RELEASE=v1.3.0 \
#     SCRIPT_DIR=build-support \
#     YB_HOME=/home/yugabyte

# WORKDIR $YB_HOME

# RUN  yum install -y epel-release && \
#      yum install -y snapd &&  \
# #     systemctl enable --now snapd.socket && \
#      ln -s /var/lib/snapd/snap /snap && \
#      snap install patchelf --edge --classic
     
# ADD https://github.com/YugaByte/yugabyte-db/archive/$YB_RELEASE.tar.gz /tmp/yugabyte.tar.gz
# # COPY packages/yugabyte*.tar.gz /tmp
# RUN tar -xvf /tmp/yugabyte*.tar.gz --strip 1
# RUN cp -rf build-support/* bin/
# RUN bin/configure

# # Expose the required ports.
# EXPOSE 7000 7100 9000 9100 12000 11000 6379 9042 10100

# # Create the data directories.
# VOLUME ["/yugabyte-data"]


