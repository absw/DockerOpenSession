# Create an image containing tools to build C++ Application
FROM gcc:9.2.0 AS tools
LABEL maintainer="Byran Wills-Heath <byran@bluefruit.co.uk>"

RUN apt-get update \
	&& apt-get install -y cmake \
	&& rm -rf /var/lib/apt/lists/*

# Build the C++ Application
FROM tools as cppbuild

RUN mkdir -p /usr/src/checkstatus/build
WORKDIR /usr/src/checkstatus/build
COPY checkstatus/ /usr/src/checkstatus

RUN cmake .. && make

# Create the application image (without the tools)
FROM ubuntu
LABEL maintainer="Byran Wills-Heath <byran@bluefruit.co.uk>"

COPY --from=cppbuild /usr/src/checkstatus/build/checkstatus /checkstatus

ENTRYPOINT [ "/checkstatus" ]
