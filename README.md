<<<<<<< HEAD

#Git tips and tricks

##Git
=======
#Git tips and tricks
>>>>>>> a21b04f920130768195ac8890224a2da408534d6

##Git
```
git commit -am "twoj message"
git commit --amend -s
git push origin HEAD:refs/for/master
git reset --hard origin/master
git clean -fd
git branch -d the_local_branch
git branch -D the_local_branch (force mode)
git branch testing
git checkout -b testing (dzieki b od razu przeskakujesz)
git push origin testing -> zaklada remote na gitlabie
git pull origin testuing
git branch -r
git status
git add nazwa_pliku
git commit --amend
git fetch -p
```

##Gerrit
<<<<<<< HEAD

=======
>>>>>>> a21b04f920130768195ac8890224a2da408534d6
```
ide na master
git pull
przechodze na branch'a local
git rebase master
ide na master
git merge branchName --squash
git commit -am "opis jakis" -sq
git commit --amend 
git push origin HEAD:refs/for/master

```

#Build tools

## Gradle 4.x

```
gradle clean build 
gradle clean build -X test (exclude) 
gradle clean build test --continue
gradle clean build --build-cache

```

## Maven 3.x
```
set MAVEN_OPTS=-Xmx2000m -XX:MaxPermSize=2000m

mvn clean install (-o install) [-T 4 - liczba watkow obslugujacych build'a, 2C - 2 watki na Core ] 
mvn versions:set -DnewVersion=2.0-SNAPSHOTKogut

junit: -Dsurefire.skipAfterFailureCount=1 -DskipTests

surefire-report:report 
cobertura:cobertura 
site 
checkstyle:checkstyle 
pmd:pmd pmd:cpd 
findbugs:findbugs 
javadoc:javadoc 

versions:display-dependency-updates 
versions:display-plugin-updates

mvn clean install versions:display-dependency-updates versions:display-plugin-updates

enforcer:enforce

dependency:analyze-report => nic nie robi
dependency:analyze-dep-mgt => o ten robi analize
dependency:analyze-duplicate => szuka duplikatow
dependency:resolve-plugins
dependency:tree -> buduje samo drzewo zaleznosci
dependency:tree -DoutputType=graphml -DoutputFile=dependency.graphml [-Dincludes=com.mossad.nac.debt]
dependency:go-offline
-fae
-P profile-1,profile-2

-rf, --resume-from, Resume reactor from specified project
-pl, --projects, Build specified reactor projects instead of all projects
-am, --also-make, If project list is specified, also build projects required by the list
-amd, --also-make-dependents, If project list is specified, also build projects that depend on projects on the list 

Zaleznosci miedzy modulami

com.github.janssk1:maven-dependencygraph-plugin:1.0:graph  -DoutputType=graphml -DoutputFile=dependency.graphml 

1)
mvn clean install -Dmaven.test.skip=true com.googlecode.maven-overview-plugin:maven-overview-plugin:RELEASE:overview => tworzy obraz zawily
mvn clean install -Dmaven.test.skip=true com.googlecode.maven-overview-plugin:maven-overview-plugin:RELEASE:overview -Dinludes=Dincludes=my.com.you.they -Dscopes=compile

2)
mvn dependency:tree -DoutputType=graphml -DoutputFile=dependency.graphml -Dincludes=my.package.ok.package
yEd Graph Editor 
By default yED will not format the graph, but it has many different formats that you can use. Two simple steps separates you from a nice graph:
a) Select Tools > Fit Note to Label > OK This should adjust the labels
b) Select Layout > Hierarchical > Orientation > Left to Right > OK 

3) mvn clean install -Dmaven.test.skip=true com.github.janssk1:maven-dependencygraph-plugin:1.2:graph -e

All in one example:
mvn clean install surefire-report:report cobertura:cobertura site checkstyle:checkstyle pmd:pmd pmd:cpd findbugs:findbugs javadoc:javadoc versions:display-dependency-updates versions:display-plugin-updates dependency:analyze-report dependency:analyze-dep-mgt dependency:analyze-duplicate dependency:resolve-plugins dependency:tree -DoutputType=graphml -DoutputFile=dependency.graphml

```