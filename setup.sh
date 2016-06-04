#!/usr/bin/env bash
. init-hooks.sh
. lib/hooks/config.data

echo "Mirroring your Drupal.org repository with the repository we have on GitHub..."
git clone --bare $GIT_DRUPAL_REPOSITORY /tmp/sourcegit.git
cd /tmp/sourcegit.git
git push --mirror $GIT_GITHUB_REPOSITORY
cd ..
rm -rf /tmp/sourcegit.git
