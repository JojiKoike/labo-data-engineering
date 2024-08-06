FROM debian:bookworm-slim as builder

WORKDIR /opt

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]
RUN curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash && \
    rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

FROM mcr.microsoft.com/vscode/devcontainers/base:bookworm
COPY --from=builder /opt/rye /opt/rye

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"
ENV PYTHONDONTWRITEBYTECODE True
ENV PYTHONUNBUFFERED True

RUN rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

RUN apt-get update && \
    apt-get install -y openjdk-17-jdk curl unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install

USER vscode
RUN python -m pip install --upgrade pip && \
    python -m pip install --upgrade pipx && \
    python -m pipx install mypy


ENV PATH="$PATH:~/.local/bin"

RUN git config --global --add safe.directory /workspace
