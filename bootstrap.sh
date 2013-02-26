#/bin/sh
set -e

if [ ! -f ".gitignore" ]; then
  echo "pulling default .gitignore"
  curl https://raw.github.com/github/gitignore/master/Objective-C.gitignore > .gitignore
else
  echo ".gitignore appears to have already been added, skipping"
fi

#git ls-remote lagrangian > /dev/null
#if test $? != 0; then
  #echo "adding lagrangian as subtree"
  #REMOTE=https://github.com/robrix/Lagrangian.git
  #BRANCH=develop
  #git remote add lagrangian $REMOTE
  #git fetch lagrangian $BRANCH
  #git subtree add --squash --prefix Lagrangian -m "Add lagrangian as subtree" lagrangian/$BRANCH
#else
  #echo "lagrangian appears to have already been added, skipping"
#fi

echo "adding a basic test to main.m"
MAIN=`find . -name "main.m"`
echo " 
  #import \"Lagrangian.h\"
  @l3_test(\"truth\") {
   assert something
  }" >> $MAIN
