FROM ubuntu:bionic
ENV USER root
ENV DISPLAY ":1"
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
RUN apt-get update -qq && apt-get install -f -y \
    software-properties-common \
    net-tools \
    nano \
    curl \
    wget \
    grep \
    xvfb \
    xterm \
    i3-wm \
    x11-xserver-utils
RUN wget -O midori.deb http://midori-browser.org/downloads/midori_0.5.11-0_amd64_.deb && \
    dpkg --unpack midori.deb && \
    apt-get install -f -y && \
    rm -rf midori.deb && \
    mkdir /main
RUN wget -q -O /tmp/tigervnc-1.7.0.x86_64.tar.gz https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.7.0.x86_64.tar.gz && \
    cd /tmp && tar -xf tigervnc-1.7.0.x86_64.tar.gz && cp -R tigervnc-1.7.0.x86_64/* /
RUN echo "password\npassword\nn\n" | vncpasswd
RUN touch /root/.Xresources
ADD xstartup.sh /root/.vnc/xstartup
ADD config.sh /root/.i3/config
ADD script.sh /script.sh
WORKDIR /main
ENTRYPOINT ["/script.sh"]
