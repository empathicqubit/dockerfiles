FROM nvidia/opencl:runtime

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends clinfo mono-complete mono-devel libssl-dev curl tzdata && \
    apt-get remove mesa-* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN curl -s -L https://github.com/lachesis/scallion/archive/gpg.tar.gz | \
    tar --strip-components=1 -zxv

RUN xbuild scallion.sln /p:TargetFrameworkVersion="v4.5"

RUN cd /usr/lib/x86_64-linux-gnu && ln -s libOpenCL.so.1.0.0 libOpenCL.so

ENTRYPOINT ["mono", "/app/scallion/bin/Debug/scallion.exe"]
