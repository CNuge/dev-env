## Notes on Git and Github usage and useful commands

To stage all changes 
`git add -A `
(or can stage specific files with git add <FILENAME>

```
git cz - run a commitizen commit
```
There will be a series of prompts on the command line to help you produce a tidy and structured commit.

Double check which branch you are on (you may also edit your .bash_profile or .bashrc as shown here to display the current branch in your command prompt):

```
git branch --show-current
#or
git branch -a #to see all branches, start indicates current 
```


Make a new branch to work on:
```
git checkout -b new_branch
```
Check out an existing branch
```
git checkout existing_branch
```
Specify which branch you want to be pushing to: 
```
git push --set-upstream origin new_branch
```
or push to specific branch with:
```
git push origin -u new_branch
```
Get an existing branch from remote and set up for commit/push/pull to that branch:
```
git fetch                     #pull remote list
git branch -v -a              #see all available branches
git switch side_branch        #track the desired branch: <side_branch>
#commits, pushes to and pulls will be from <side_branch>
```
View the commit history from the command line
```
git log
```
Compare changes made in last commit to the previous commit:
```
git diff
```
Compare two branches:
```
git diff prod..dev #where prod and dev are the names of two existing branches
```
Get the ID of the Head Node:
```
git rev-parse --short HEAD
```
If you stage something by accident, and want to remove it and restart, use the following:
```
git reset 
```
Tag a software release version via git

Remember to follow the conventions of semantic versioning as outlined in the team’s https://sequencebio.atlassian.net/wiki/spaces/SEQUENCEPE/pages/632750081 document. The following creates an annotated tag of version 0.1.0with a short message.
```
git tag -a 0.1.0 -m "initial release"
```
you then need to push the tag specifically
```
git push origin --tags 
```
you can check all the tagged versions of a repository with
```
 git tag -l 
```
From the Github home page of the repository, you can select the “releases” tab on the right side of the screen to create a release of the software. Select the tagged version and add a title and more detail to the release notes as needed.

Pull changes from main branch onto a side branch you are working one (note, you should do this before submitting a pull request to ensure your branch will play nicely with the main.
```
git merge origin main
```
Delete a branch locally (desirable after merging a PR)
```
git branch -d <old_branch_name>
```