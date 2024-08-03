FROM mcr.microsoft.com/devcontainers/go:1-1.22-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl pre-commit

RUN go install github.com/cweill/gotests/gotests@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install honnef.co/go/tools/cmd/staticcheck@latest
RUN go install golang.org/x/tools/gopls@latest

# For Protocol Buffer
RUN go install github.com/bufbuild/buf/cmd/buf@latest
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install connectrpc.com/connect/cmd/protoc-gen-connect-go@latest
RUN go install github.com/envoyproxy/protoc-gen-validate@latest

# Hot Reload
RUN go install github.com/air-verse/air@latest

RUN chown -R vscode:vscode /go
RUN git config --global --add safe.directory /workspace
