# Dockerfile
FROM ubuntu:24.04 AS base

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      fortune-mod cowsay curl ca-certificates bash && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy repo files
COPY . /app
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["/app/wisecow.sh"]

