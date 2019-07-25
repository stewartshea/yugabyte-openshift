FROM yugabytedb/yugabyte:latest 

VOLUME ["/yugabyte-data"]

# Set permissions for OpenShift
RUN chgrp -R 0 /yugabyte-data && \
    chmod -R g=u /yugabyte-data

RUN chmod g=u /etc/passwd


COPY entrypoint* ./

ENTRYPOINT ["/bin/bash", "-c" , "./entrypoint.sh"]