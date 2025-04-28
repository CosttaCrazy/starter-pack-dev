# 🛠️ Linux Dev Setup - Infra de Desenvolvimento Automático

Este projeto automatiza o setup de um ambiente de desenvolvimento profissional no Linux (Ubuntu/Debian), incluindo:
- Ferramentas de desenvolvimento
- Linguagens (Node, Python, Go, Rust, .NET)
- Docker e Kubernetes (minikube, helm)
- Bancos de dados locais (Postgres, MySQL, Mongo, Redis)
- Ferramentas de segurança e análise de código
- Configuração de terminal avançado com Oh-My-Zsh

## 🚀 Oque é Instalado?

- Ferramentas CLI: git, docker, podman, fzf, htop, tmux, etc.
- Linguagens: Node.js (nvm), Python (pyenv), Go, Rust, .NET
- Cloud DevOps: Terraform, Ansible, kubectl, helm, minikube
- Banco de Dados Local: PostgreSQL, MySQL, MongoDB, Redis
- Segurança: Trivy, Semgrep, Bandit, Fail2Ban
- Editor: Visual Studio Code + Extensões DevOps/Cloud/Segurança


## 🚀 Como Rodar

### Opção 1: Executar o Script
```bash
chmod +x setup-dev-environment.sh
./setup-dev-environment.sh
```
### Opção 2: Usar Ansible

```bash
ansible-playbook setup-dev.yml
```

### Opção 3: Criar Container de Desenvolvimento

```bash
docker build -t dev-environment .
docker run -it dev-environment
```

## 🛠️ Usando Makefile para facilitar o setup

Comandos disponíveis:

```bash
make setup    # Rodar o script de instalação na máquina
make build    # Buildar ambiente Docker
make up       # Subir ambiente de desenvolvimento e bancos de dados
make down     # Derrubar ambiente
make logs     # Ver logs dos serviços
make shell    # Acessar container dev com ZSH

## License

See the LICENSE file for license rights and limitations (MIT).
