# https://scoop.sh/

scoop uninstall scoop

# for broken installation, remove the directory of ~/scoop

# Scoop installation
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')

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

# Java installation
scoop bucket add java
scoop install find-java
scoop install oraclejdk10
scoop install oraclejdk-lts
scoop reset oraclejdk-lts

# Java Tools
scoop install maven
scoop install gradle
scoop install groovy
scoop install springboot

# Java IDE: IDEA
scoop install idea

# AWS cli tool and lambda cli
pip install awscli

# docker required VM provider, which needs to have admin role for installation
# scoop install docker
# pip install --user aws-sam-cli

# $pyScriptsPath = [System.Environment]::GetEnvironmentVariable("PYSCRIPTS_PATH", "USER")

# if ($pyScriptsPath.length -eq 0) {
#     $pyScriptsPath = [System.Environment]::SetEnvironmentVariable("PYSCRIPTS_PATH", "~\AppData\Roaming\Python\Python37\Scripts", "USER")
#     $path = [System.Environment]::GetEnvironmentVariable("PATH", "USER")
#     $newPath = $pyScriptsPath + ";" + $path
#     [System.Environment]::SetEnvironmentVariable("PATH", $newPath, "USER")
# }

# Communication Tools
scoop install telegram
scoop install slack

# Developer Tools

# vagrant required VM provider, which needs to have admin role for installation
# scoop bucket add nonportable
# scoop install virtualbox-np
# scoop install vagrant

scoop install postman

# IDE / Editor
scoop install vim
scoop install vscode

# PowerShell Theming
# https://github.com/lukesampson/concfg
scoop install concfg
concfg presets
concfg import onedark
