# Golang Place

## Environment

Here is the environment I will use during those trainings and how to setup the place.

Go 1.26.3

# Download & execute script .._install.sh

I made a little install script to automate Go install :

You can use this commande :

```bash
go install golang.org/x/website/tour@latest
chmod ~/go/bin/tour
~/go/bin/tour
```

It download and install Go in latest version, plus it place a *tour* binary in $GOPATH's bin directory to be ready up to start and try Golang immerdiatly.

Or use the script I just created

```bash
curl -LO https://github.com/Newfile01/prog-training/blob/main/golang/go-env_install.sh
chmod +x go-env_install.sh
sudo sh go-env_install.sh
```

This will:

- Download and verify Go 1.26.3 in /usr/local
- Install the packages
- Add Go to $PATH for completion
- Test & cleanup useless files

> [!NOTE]
> This setup is for your current user. You will have to modify the script to expand to global scope

You'll need to create to create go/ directory with the right sub-directories to start at $GOPATH path (use `go env` to get it)