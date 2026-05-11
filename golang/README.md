# <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.-wxFAYywSfCNVdjeBnx9TAHaHa%3Fpid%3DApi&f=1&ipt=e69bb255b03025bbe5c70dcd415abaf4fbbddf7a1092d8b80bd79a5e15ce6cfc&ipo=images" alt="Go Icon" width="140" height="100" display="inline" > Golang Place


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

> [!NOTE]
> This setup is for your current user. You will have to modify the script to expand to global scope

