FROM mcr.microsoft.com/vscode/devcontainers/base:bookworm

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    terraform \
    direnv \
		pre-commit\
    curl \
    golang-go \
  && rm -rf /var/lib/apt/lists/*

RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
RUN go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

RUN echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
RUN git config --global --add safe.directory /workspace
