FROM ubuntu:16.04

# Environment variables
ENV DOMAIN localhost
ENV USERNAME admin
ENV PASSWORD admin
ENV LC_CTYPE en_US.UTF-8
RUN apt-get clean && apt-get -y update && apt-get install -y locales && locale-gen en_US.UTF-8

# Setup scripts for LibreOffice Online
ADD container-files /
RUN bash /install-libreoffice.sh

EXPOSE 9980

# Entry point
ENTRYPOINT ["/config/bootstrap.sh"]
CMD [""]

