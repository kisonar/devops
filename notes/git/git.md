# Git
## Git general
```
git checkout -b testing (moves you to local branch testing)
git push origin testing -> makes remote at gitlab
git status
git add file_name
git commit -am "your message"
git commit --amend -s
git pull origin testing
git fetch -p

git reset --hard origin/master
git clean -fd

git branch -d the_local_branch
git branch -D the_local_branch (force mode)

git branch -r

GIT_SSH_COMMAND="ssh -v" git pull

git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D -> clenup
```
##### Git releasing with updating branches
```
Preparing release branch:

git checkout develop
git pull
git checkout stage
git pull
git branch release/<release-number>  e.g. <release-number> = 2.0.1
git checkout release/<release-number>
git merge develop
git push origin release/<release-number>

Having it done at GitHub you will see a new branch. Based on it you will be able to create pull request.
When creating pull request, check if you want to merge PR to master branch. GitHub by default points to develop.
DO NOT MERGE PR from GitHub WEB UI !!!

Creating release to stage:

git checkout stage
git pull
git merge --ff release/<version_number>
git tag <version_number>
git push origin stage --tags

After last step exposed PR will change it' state to merged. In case related remote branch has not been removed - delete it. Do not remove local branch release/<version_number>. It will be required in next step.

Creating release to main:

git checkout main
git pull
git merge --ff release/<version_number>
git push origin main --tags

Note: tags can be skipped
```
##### Gerrit
```
go to master
git pull
swithc to branch'a local
git rebase master
go to master
git merge branchName --squash
git commit -am "opis jakis" -sq
git commit --amend 
git push origin HEAD:refs/for/master
```