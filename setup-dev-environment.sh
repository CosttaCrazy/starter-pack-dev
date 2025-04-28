#!/bin/bash

set -e

echo "🔵 Ambiente de Desenvolvimento Linux - Setup Modular"

# Funções por perfil
install_essentials() {
  echo "🔹 Instalando Essenciais..."
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y build-essential git curl wget zsh tmux htop fzf ripgrep bat exa zoxide lazygit gh gpg
}

install_devtools() {
  echo "🔹 Instalando Ferramentas de Desenvolvimento..."
  sudo apt install -y libssl-dev zlib1g-dev libffi-dev libreadline-dev libsqlite3-dev pkg-config docker.io docker-compose podman
  sudo systemctl enable docker
  sudo systemctl start docker
}

install_cloud_devops() {
  echo "🔹 Instalando DevOps Tools..."
  sudo apt install -y terraform ansible
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl && sudo mv kubectl /usr/local/bin/
  curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
  sudo apt install -y apt-transport-https
  echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
  sudo apt update && sudo apt install -y helm
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
}

install_languages() {
  echo "🔹 Instalando Linguagens..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  curl https://pyenv.run | bash
  sudo apt install -y golang
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  sudo apt update
  sudo apt install -y dotnet-sdk-8.0
}

install_security() {
  echo "🔹 Instalando Ferramentas de Segurança..."
  curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo bash
  curl -sL https://semgrep.dev/install.sh | sh
  pip install bandit pre-commit
  sudo apt install -y fail2ban
}

install_databases() {
  echo "🔹 Instalando Bancos de Dados..."
  sudo apt install -y postgresql postgresql-contrib mysql-server mongodb redis-server
}

install_vscode() {
  echo "🔹 Instalando VS Code e Extensões..."
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt update
  sudo apt install -y code
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-vscode-remote.remote-ssh
  code --install-extension eamodio.gitlens
  code --install-extension esbenp.prettier-vscode
  code --install-extension ms-python.python
  code --install-extension rust-lang.rust-analyzer
  code --install-extension golang.go
  code --install-extension redhat.vscode-yaml
  code --install-extension hashicorp.terraform
  code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
  code --install-extension github.copilot
  code --install-extension streetsidesoftware.code-spell-checker
}

install_ohmyzsh() {
  echo "🔹 Instalando Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Menu de opções
echo "Escolha o perfil de instalação:"
echo "1) Essencial (Sistema + Docker)"
echo "2) Full Dev (Essencial + DevTools + Linguagens)"
echo "3) Full Stack (Tudo)"
read -p "Opção: " option

case $option in
  1)
    install_essentials
    install_devtools
    install_ohmyzsh
    ;;
  2)
    install_essentials
    install_devtools
    install_languages
    install_vscode
    install_ohmyzsh
    ;;
  3)
    install_essentials
    install_devtools
    install_cloud_devops
    install_languages
    install_security
    install_databases
    install_vscode
    install_ohmyzsh
    ;;
  *)
    echo "❌ Opção inválida"
    exit 1
    ;;
esac

echo "✅ Setup concluído!"
