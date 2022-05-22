#!/bin/bash
POFILE=$1

if [[ $POFILE == "" ]]; then
  for i in *.po
  do
    echo -n $i": "
    msgmerge --backup=none --update $i man.pot && \
    msgfmt -o /dev/null --statistics --check $i
  done
else
  echo -n $1".po: "
  msgmerge --backup=none --update $1.po man.pot && \
  msgfmt -o /dev/null --statistics --check $1.po
fi
