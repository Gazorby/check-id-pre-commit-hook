#!/usr/bin/env bash
#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#
# To enable this hook, rename this file to "pre-commit".
if git rev-parse --verify HEAD >/dev/null 2>&1
then
 against=HEAD
else
 # Initial commit: diff against an empty tree object
 against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi
# Redirect output to stderr.
exec 1>&2
REMOTE=`git config --get remote.origin.url`
USERNAME=`git config --get user.name`
EMAIL=`git config --get user.email`
checkEmailUsername() {
  if [[ "$EMAIL" != "$1" ]]
  then
    echo "Invalid email: $EMAIL"
    echo "git config user.email $1"
    exit 1
  fi
if [[ "$USERNAME" != "$2" ]]
  then
    echo "Invalid username: $USERNAME"
    echo "git config user.name \"$2\""
    exit 1
  fi
}
if [[ $REMOTE == *"gitlab.unifeyes.com"* ]]
then
  checkEmailUsername matthieu.macnab@h2ofintech.com "Matthieu Mac Nab"
fi
if [[ $REMOTE == *"github.com"* ]]
then
  checkEmailUsername mmacnab22@gmail.com "gazorby"
fi