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

This will:

- Download and verify Go 1.26.3 in /usr/local
- Install the packages
- Add Go to $PATH for completion
- Test & cleanup useless files

> [! NOTE ]
> This setup is for your current user. You will have to modify the script to expand to global scope