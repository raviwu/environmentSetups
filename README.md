## Windows

For better unifying the windows command line setups, recommend using [scoop](https://scoop.sh) as a package manager.

Install `make` tools for your windows gitbash:

```shell
# In your gitbash shell under root folder of this repo
# Take the scoop installed git for example:
unzip libs/make-4.2.1-without-guile-w32-bin.zip -d ~/scoop/apps/git/current/mingw64
```

## MacOS

A plain shell script is good to go.

## Editor

### VScode

A starter for VScode json configurationa.

### Vim

[Vgod's vimrc](https://github.com/vgod/vimrc) is a good starting point.

## Jenkins

Quick construct a basic Jenkins instance to develop your side projects, run:

```
make jenkins-initialize

# Wait until the plugins installed and the running
# instanct, use ctrl+C to terminate it.

# For windows, restart are not supported, need to
# manual restart the jenkins instance.

make jenkins-run
```

and visit `http://localhost:9090`

You get a no user auth Jenkins playground with blank plugins.

