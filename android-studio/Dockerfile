FROM base/archlinux:2018.08.01

WORKDIR /workdir

RUN pacman --noconfirm -Sy mate-icon-theme python-pip python2-pip ttf-fira-code ttf-fira-mono ttf-inconsolata xorg yarn git base-devel curl

RUN mkdir yay \
    && cd yay \
    && curl -L https://github.com/Jguer/yay/releases/download/v8.1101/yay_8.1101_x86_64.tar.gz > yay.tar.gz \
    && tar --strip-components=1 -xvf yay.tar.gz \
    && cp yay /usr/bin/yay \
    && cd .. \
    && rm -rf yay

RUN useradd -m archie \
    && echo archie:CHANGEME | chpasswd \
    && usermod -a -G wheel archie

RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel

USER archie

RUN yay --noconfirm -Sy android-studio

RUN yay --noconfirm -Sy direnv android-sdk-platform-tools

USER root

RUN pacman --noconfirm -Sy pulseaudio

COPY ./pulse-client.conf /etc/pulse/client.conf

RUN groupadd -g 46 plugdev \
    && usermod -a -G plugdev archie

RUN rm /etc/sudoers.d/wheel

USER archie

ENV DISPLAY :0

CMD ["android-studio"]
