# Kubebuilder

Ce dossier contiendra les travaux avec le framework kubebuilder

## Quickstart

**Prérequis**
```bash
go version v1.24.6+
docker version 17.03+.
kubectl version v1.11.3+.
Access to a Kubernetes v1.11.3+ cluster.
```

## Installation

```bash
# download kubebuilder and install locally.
curl -L -o kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)"
chmod +x kubebuilder && sudo mv kubebuilder /usr/local/bin/

# Ajout de l'autocompletion au shell
cat >> ~/.bashrc <<'EOF'
# Kubebuilder
# autocompletion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi
. <(kubebuilder completion bash)
EOF

source ~/.bashrc

# Création d'un projet
mkdir -p ~/projects/guestbook
cd ~/projects/guestbook
kubebuilder init --domain my.domain --repo github.com/Newfile01/prog-training.git/operator-k8s/kubebuilder/guestbook

```

