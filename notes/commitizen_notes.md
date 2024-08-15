## Set up your projects using cookiecutter
cookiecutter project templates 

## Install commitizen

Run this once per conda environment:
```
npm install -g commitizen cz-conventional-changelog
```
or 

```
conda install commitizen
```

## Initializing a new project 

Once you’ve gotten your brand new cookiecutter-templated project ready to go, you should navigate into the project directory and make it “commitizen friendly”.  Make sure your dev environment is activated (mamba activate dev), then run (this is documented in the commitizen docs):

```
commitizen init cz-conventional-changelog --save-dev --save-exact

```
Then, run git init to put the project under version control.

### Install pre-commit
Pre-commit is a system to uniformly apply code linting on every commit.  It is listed as a dependency in the dev environment yaml available in the cookiecutter repository.  When you run cookiecutter and select the languages for which you’ll want linting support, you will end up with a .pre-commit-config.yaml with the relevant pre-commit hooks listed.

```
cd <repo>
cp ~/.pre-commit-config.yaml .
```
Modify the contents of the pre-commit file accordingly.
For sub"sequent pushes with commitizen, it will run automatically.

Run `pre-commit install` once per repository to set up the hooks.


If necessary, override with:
```
git add -A
git commit -m "drastic push" --no-verify
git push

```

### Development cycle
Every time you start to code, you should expect to follow this cycle:

On start: `git pull origin <branch>`

If needed to create a new branch: `git checkout -b <feature_branch_name>`

After writing/testing: `git add <files_you_want_to_stage>`

Before committing: `pre-commit run` (iterate here if you need to address lint)

If you are getting multiple linter fails, you can pull them out one at a time using: `pre-commit run <hook_id>`

Note: for the lintr hook (which runs the R package lintr to check the R code files), it can be useful to work through the tagged issues within RSudio. After installing the lintr library, run lint("file_to_delint.r") in the Console. The error messages will print out in an easier to read format than the terminal, and Rstudio will tag the lines in the text editor to help guid you to the issues.

After de-linting: `git cz`

Note that if set up properly, running this will trigger another round of pre-commit hooks, and commitizen will only allow your commit to succeed if the pre-commit checks all pass.  Occasionally, you will want to circumvent this (e.g. if an update to the hooks causes an internal conflict between two linters).  In this case, you may run `git cz --no-verify`.

Repeat for each small chunk of development

At the end of the coding session: `git push origin <branch>`