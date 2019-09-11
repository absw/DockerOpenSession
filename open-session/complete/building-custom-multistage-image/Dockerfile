# Create an image containing tools to build C++ Application
FROM gcc:9.2.0 AS tools
LABEL maintainer="Byran Wills-Heath <byran@bluefruit.co.uk>"

RUN apt-get update \
	&& apt-get install -y cmake \
	&& rm -rf /var/lib/apt/lists/*

# Build the C++ Application
FROM tools as cppbuild

RUN mkdir -p /usr/src/check-status/build
WORKDIR /usr/src/check-status/build
COPY check-status/ /usr/src/check-status

RUN cmake .. && make

# Create the application image (without the tools)
# Use an official Python runtime as a parent image
FROM python:2.7-slim
LABEL maintainer="Byran Wills-Heath <byran@bluefruit.co.uk>"

COPY --from=cppbuild /usr/src/check-status/build/checkstatus /app/checkstatus

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./python-flask-server /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]