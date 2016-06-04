#!/usr/bin/env bash
. config.data

# Mirroring changes to GitHub in order to start the automated tests.

git clone --mirror $GIT_DRUPAL_REPOSITORY /tmp/sourcegit.git
# Make a bare mirrored clone of the repository

cd /tmp/sourcegit.git
git remote set-url --push origin GIT_GITHUB_URL
# Set the push location to your mirror

git fetch -p origin
git push --mirror

cd ../
rm -rf /tmp/sourcegit.git