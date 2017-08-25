FROM sameersbn/redmine:3.3.2-1
MAINTAINER flobo

RUN cd /opt \
+&& wget http://javadl.oracle.com/webapps/download/AutoDL\?BundleId\=218823_e9e7ea248e2c4826b92b3f075a80e441 -O jre-8u121-linux-x64.tar.gz \
 && tar zxvf jre-8u121-linux-x64.tar.gz \
 && ln -s /opt/jre1.8.0_121/bin/java /usr/bin/java \
 && ln -s /opt/jre1.8.0_121/bin/javaws /usr/bin/javaws \
 && wget http://sourceforge.net/projects/plantuml/files/plantuml.jar/download -O plantuml.jar \
 && echo '#!/bin/bash' >> /usr/bin/plantuml \
 && echo '/usr/bin/java -Djava.io.tmpdir=/var/tmp -Djava.awt.headless=true -jar /opt/plantuml.jar ${@}' >> /usr/bin/plantuml \
 && chmod u+x /usr/bin/plantuml

RUN chown ${REDMINE_USER}:${REDMINE_USER} /usr/bin/plantuml
