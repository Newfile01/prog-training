# Golang place

## Environment

Here is the environment I will use during those trainings and how to setup the place.

Go 1.26.3

# Download & execute script .._install.sh

I made a little install script to automate Go install :

```bash
curl -LO https://github.com/Newfile01/prog-training/blob/main/golang/go-env_install.sh
chmod +x go-env_install.sh
sudo sh go-env_install.sh
```


```bash
#!/bin/bash
set -e

# Download and verify checksum
curl -LO https://go.dev/dl/go1.26.3.linux-amd64.tar.gz
if [ "$(sha256sum go1.26.3.linux-amd64.tar.gz | cut -d' ' -f1)" = "2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556" ]; then
    echo "✅ Valid file"
else
    echo "❌ Invalid checksum"
    exit 1
fi

# Remove old & Download new Go compilator
sudo rm -rf /usr/local/go
sudo mv go1.26.3.linux-amd64.tar.gz /usr/local/go
# Test
if [ -f "/usr/local/go1.26.3.linux-amd64.tar.gz" ]; then 
    echo "✅ File downloaded"
else 
    echo "❌ File missing"
    exit 1
fi

sudo tar -C /usr/local -xzf /usr/localgo1.26.3.linux-amd64.tar.gz



# Add to $PATH (user), add to $HOME/.profile or /etc/profile for wide
export PATH=$PATH:/usr/local/go/bin
# Test
command -v go >/dev/null 2>&1 && echo "✅ Go added to \$PATH"

# Test
go version >/dev/null 2>&1 && echo "✅ Go OK" || echo "❌ Go absent"

# Clean directory
sudo rm -rf /usr/local/go1.26.3.linux-amd64.tar.gz

# Refresh shell
source ~/.bashrc
```