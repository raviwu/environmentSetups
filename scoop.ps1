# https://scoop.sh/

scoop uninstall scoop

# for broken installation, remove the directory of ~/scoop

# Scoop installation
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# add Git so that scoop can install packages from extras bucket
scoop install git
scoop install openssh
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')
scoop bucket add extras

# Common unix like apps and python
scoop install which
scoop install touch
scoop install python
scoop install curl
scoop install cacert
python -m pip install --upgrade pip

# Java Tools
scoop install maven
scoop install gradle

# AWS cli tool
pip install awscli
pip install --user aws-sam-cli

# Communication Tools
scoop install telegram
scoop install slack

# Developer Tools
scoop install docker
scoop install vagrant
scoop install postman

# IDE / Editor
scoop install vim
scoop install vscode

# PowerShell Theming
# https://github.com/lukesampson/concfg
scoop install concfg
concfg presets
concfg import solarized-dark
