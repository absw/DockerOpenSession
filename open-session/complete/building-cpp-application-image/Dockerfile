FROM gcc:9.2.0
LABEL maintainer="Byran Wills-Heath <byran@bluefruit.co.uk>"

RUN apt-get update                     \
	&& apt-get install -y cmake        \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /cppapp/build
WORKDIR /cppapp/build
COPY check-status/ /cppapp

RUN cmake .. && make

CMD [ "./checkstatus" ]
