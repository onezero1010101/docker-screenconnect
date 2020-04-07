FROM debian:stretch

# Install dependencies
RUN apt-get update
RUN apt-get -y install wget procps

# Clean
RUN rm -rf /var/lib/apt/lists/*

# Prepare directories
RUN mkdir /opt/screenconnect-installer

# Setup
#ADD "https://www.screenconnect.com/Download?Action=DownloadLatest&Platform=Linux&PreRelease=false" /opt/screenconnect-installer/ScreenConnect_Release.tar.gz
#ADD ScreenConnect_Release.tar.gz /opt/screenconnect-installer/
#ADD ScreenConnect_19.0.23665.7058_Release.tar.gz /opt/screenconnect-installer/
#ADD ScreenConnect_19.2.24707.7131_Release.tar.gz /opt/screenconnect-installer/
#ADD ScreenConnect_19.4.25759.7247_Release.tar.gz /opt/screenconnect-installer/
#ADD ScreenConnect_19.6.27027.7360_Release.tar.gz /opt/screenconnect-installer/
ADD ScreenConnect_20.1.27036.7360_Release.tar.gz /opt/screenconnect-installer/

WORKDIR /opt/screenconnect-installer/
#RUN tar xvf ScreenConnect_Release.tar.gz
RUN echo -e "\n\n" | ScreenConnect_*_Install/install.sh

# Volume
VOLUME /opt/screenconnect/
#VOLUME /opt/

# Ports
EXPOSE 8040 8041

# Command
ADD run.sh /run.sh
WORKDIR /opt/screenconnect
CMD ["/bin/sh", "/run.sh"]

