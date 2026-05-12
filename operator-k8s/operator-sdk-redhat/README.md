# Construction d'un Opérateur Kubernetes

Sources : [Operator SDK - Home](https://sdk.operatorframework.io/) - [Operator SDK - Install](https://sdk.operatorframework.io/docs/installation/) - [Operator SDK - Frameworks](https://github.com/operator-framework)


## Installation depuis GitHub)

Prérequis : `git curl gpg`

```bash
# Récupération de l'archtiecture de votre système
export ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
export OS=$(uname | awk '{print tolower($0)}')

# Téléchargement du binaire approprié
export OPERATOR_SDK_DL_URL=https://github.com/operator-framework/operator-sdk/releases/download/v1.42.2
curl -LO ${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}

# Vérifier le téléchargerment
gpg --keyserver keyserver.ubuntu.com --recv-keys 052996E2A20B5C7E && echo "✅​ Binaire valide"

# Téléchargement et validation des sommes de contrôle
curl -LO ${OPERATOR_SDK_DL_URL}/checksums.txt
curl -LO ${OPERATOR_SDK_DL_URL}/checksums.txt.asc
gpg -u "Operator SDK (release) <cncf-operator-sdk@cncf.io>" --verify checksums.txt.asc && echo "✅​ Checksum OK"

# Afficher la correspondance SDK - Architecture
grep operator-sdk_${OS}_${ARCH} checksums.txt | sha256sum -c -

# Observer quelque chosez comme "operator-sdk_linux_amd64: OK"

# Installation du package
chmod +x operator-sdk_${OS}_${ARCH} && sudo mv operator-sdk_${OS}_${ARCH} /usr/local/bin/operator-sdk
```

Sinon version installation avec `Go` et `make`

```bash
git clone https://github.com/operator-framework/operator-sdk
cd operator-sdk
git checkout main
rm -f .git
if [ "$GOPROXY" = "https://proxy.golang.org,direct" ] || \
   [ "$GOPROXY" = "https://proxy.golang.org|direct" ]; then
    echo "✅ GOPROXY OK"
    make install
else
    echo "❌ GOPROXY invalide : $GOPROXY"
    exit 1
fi
```

## Quickstart

Prérequis :
- Avoir un utilisateur pouvant gérer son cluster
- Un registre de sauvegarde pour les images operator (comme hub.docker.com)