FROM swift:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the necessary files from your local directory to the container
COPY Package.swift .
COPY Makefile .
COPY Sources ./Sources
COPY Tests ./Tests

# Install system dependencies for the build
RUN apt-get update && apt-get install -y libgd-dev libjpeg-dev libpng-dev make imagemagick

# Run Swift build and then install
RUN make install

# Use the wrapper script as the entry point
ENTRYPOINT ["appicon"]