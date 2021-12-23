## Git
##### Git general
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