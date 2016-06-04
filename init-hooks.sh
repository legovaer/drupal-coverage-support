#!/usr/bin/env bash
. config.data
clear
echo "
WARNING: This script will update your GIT hooks and commit them to your Drupal.org repository.
Make sure that you have modified the configuration file
(lib/hooks/config.data) according to your settings.

Double check your configuration options:
Drupal.org repository: $GIT_DRUPAL_REPOSITORY
GitHub repository:     $GIT_GITHUB_REPOSITORY
GitHub project URL:    $GIT_GITHUB_URL

"
read -p "Press [Enter] key to automize your Drupal module deployment..."

mv config.data lib/hooks

# First add the hooks to the current git repository
echo "Setting up your new GIT hooks..."
HOOK_NAMES="post-commit post-merge"

HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks

function hooks_wrapper() {
    if [ -x $0.local ]; then
        $0.local "$@" || exit $?
    fi
    if [ -x lib/hooks/$(basename $0) ]; then
        lib/hooks/$(basename $0) "$@" || exit $?
    fi
}

for hook in $HOOK_NAMES; do
    # If the hook already exists, is executable, and is not a symlink
    if [ ! -h $HOOK_DIR/$hook -a -x $HOOK_DIR/$hook ]; then
        mv $HOOK_DIR/$hook $HOOK_DIR/$hook.local
    fi
    # create the symlink, overwriting the file if it exists
    # probably the only way this would happen is if you're using an old version of git
    # -- back when the sample hooks were not executable, instead of being named ____.sample
    ln -s -f hooks_wrapper $HOOK_DIR/$hook
done

git add .git/hooks
git commit -m "AUTOMATED: Added git hooks"
git push