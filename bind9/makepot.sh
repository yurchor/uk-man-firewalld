#!/bin/bash

  po4a-gettextize --format man --master-charset UTF-8 --po bind9.pot \
   --msgid-bugs-address "trans-uk@lists.fedoraproject.org" --copyright-holder "FSF" \
   --package-name "BIND9 documentation" --package-version "1.0" \
   $(
for doc in ./*.1; do
  echo --master $doc
done
  )
