#!/usr/bin/env sh

_() {
  YEAR="1998"
  # echo "Github Username: "
  # read -r USERNAME
  USERNAME="DsCodeStudio"

  [ -z "$USERNAME" ] && exit 1
  [ ! -d $YEAR ] && mkdir $YEAR

  cd "${YEAR}" || exit
  git init
  echo "**${YEAR}** - Generated by https://github.com/antfu/1990-script" \
    >README.md
  git add .
  GIT_AUTHOR_DATE="${YEAR}-08-08T08:08:08" \
    GIT_COMMITTER_DATE="${YEAR}-08-08T08:08:08" \
    git commit -m "${YEAR}"
  git remote add origin "https://github.com/${USERNAME}/${YEAR}.git"
  git branch -M main
  git push -u origin main -f
  cd ..
  rm -rf "${YEAR}"

  echo
  echo "Cool, check your profile now: https://github.com/${USERNAME}"
} && _

unset -f _
