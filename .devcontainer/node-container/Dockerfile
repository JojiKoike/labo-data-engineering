FROM mcr.microsoft.com/devcontainers/javascript-node:1-18

# Install latest pnpm
RUN npm install -g pnpm

WORKDIR /opt

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl pre-commit

ENV HOST 0.0.0.0
EXPOSE 4321

RUN git config --global --add safe.directory /workspace
