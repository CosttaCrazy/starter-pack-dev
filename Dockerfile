FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential git curl wget zsh tmux htop fzf ripgrep \
    docker.io docker-compose podman golang \
    postgresql mysql-server mongodb redis-server \
    bat exa zoxide lazygit gh gpg \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://pyenv.run | bash && \
    curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | bash

RUN useradd -ms /bin/bash devuser
USER devuser
WORKDIR /home/devuser

CMD [ "zsh" ]
