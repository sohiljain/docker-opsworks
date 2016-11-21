# Use Ububtu 14.04 as our base O/S
FROM ankitkariryaa/sbt-javac

# Set our working directory
WORKDIR /home

COPY script.sh /home/script.sh

RUN /bin/bash /home/script.sh
