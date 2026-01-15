#!/bin/sh
appname="nvim-minimax"
dt=$(date +'%y-%m-%d')

minimax_reinit() {
  # Find the initial commit
  icommit=$(git log --grep='~init' --oneline | cut -d ' ' -f 1)
  git checkout "$icommit"

  # Use a temp branch keep changes isolated
  git checkout -b "$nvimdt"

  # Init default MiniMax config
  git clone --filter=blob:none https://github.com/nvim-mini/MiniMax __MiniMax
  NVIM_APPNAME="$appname" nvim -l __MiniMax/setup.lua
  rm -rf __MiniMax

  # Commit default config
  git add -A
  git commit -m "init ~minimax $nvimdt"
}

minimax_commits() {
  git log main --oneline --format='%H' --reverse --grep='~init\|~minimax' --invert-grep
}

minimax_cherrypick() {
  minimax_commits | xargs -IQQQQ git cherry-pick QQQQ
}

minimax_newmain() {
  # Re-create main branch
  git branch -D main
  git checkout -b main
  git push --set-upstream origin --force main

  # Clean up
  git branch -D "$nvimdt"
}

minimax_reinit
minimax_cherrypick
minimax_newmain
