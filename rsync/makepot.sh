#!/bin/bash

  po4a-gettextize --format man --master-charset UTF-8 --po rsync.pot \
   --msgid-bugs-address "trans-uk@lists.fedoraproject.org" --copyright-holder "FSF" \
   --package-name "rsync documentation" --package-version "1.0" \
   $(
for doc in ./*.1; do
  echo --master $doc
done
  )
