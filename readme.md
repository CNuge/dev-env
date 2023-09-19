# dotfiles and setup
## Cam's forked version of Bari's default dev environment for use with aws


## setting up environment on aws from scratch

once onto aws, want to be able to get the environment moving quickly in an automated fashion.

1. login to aws via command line, navigate to environment

2. clone repository using HTTPS link:
`git clone https://github.com/CNuge/dot_files_and_setup.git`

3. Do work

- NB adding text, don't have nano by default on aws, going to have to get used to vim
    vi #open
    i #insert text
    esc #finish insert
    :w  #save modified file
    :qa #just quit

4. push/pull to/from github
- use personal access token instead of actual password when prompted.
 https://github.com/settings/tokens


5. set up mamba

```
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
    bash Mambaforge-Linux-x86_64.sh
```

accept the liscence, don't scroll too fast as you need to type "yes" on final line

```
source ~/.bashrc
```


