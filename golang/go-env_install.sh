#!/bin/bash
set -e

# Download and verify checksum
curl -LO --output-dir /usr/local https://go.dev/dl/go1.26.3.linux-amd64.tar.gz
if [ "$(sha256sum /usr/local/go1.26.3.linux-amd64.tar.gz | cut -d' ' -f1)" = "2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556" ]; then
    echo "✅ Valid file"
else
    echo "❌ Invalid checksum"
    exit 1
fi

# Remove old & Download new Go compilator
sudo rm -rf /usr/local/go

# Test
if [ -f "/usr/local/go1.26.3.linux-amd64.tar.gz" ]; then 
    echo "✅ File downloaded"
else 
    echo "❌ File missing"
    exit 1
fi

sudo tar -C /usr/local -xzf /usr/local/go1.26.3.linux-amd64.tar.gz

# Persist PATH
if ! grep -q "/usr/local/go/bin" "$HOME/.profile"; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >> "$HOME/.profile"
    echo "✅ PATH ajouté à ~/.profile"
fi

# Add to $PATH (user), add to $HOME/.profile or /etc/profile for wide
export PATH=$PATH:/usr/local/go/bin
# Test
command -v go >/dev/null 2>&1 && echo "✅ Go added to \$PATH"

# Test
go version >/dev/null 2>&1 && echo "✅ Go OK" || echo "❌ Go absent"

# Clean directory
if [ -f "/usr/local/go1.26.3.linux-amd64.tar.gz" ]; then sudo rm -rf /usr/local/go1.26.3.linux-amd64.tar.gz; fi

# Refresh shell
source ~/.bashrc
