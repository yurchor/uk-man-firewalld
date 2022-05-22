#!/bin/bash -e
LANG=$1

for doci in ./*.1; do
  docfilename=${doci#*/}
  doc=${docfilename%.*}
  if [[ $LANG == "" ]]; then
    for i in *.po
    do
       ILANG=${i%.*}
       echo "Producing man "$doc" for locale "$ILANG
       po4a-translate -k 0 --format man --master-charset utf-8 --localized-charset utf-8 \
         --master ./${doc}.1 \
         --po $ILANG.po --localized $ILANG/${doc}.1
       perl -i -p -e "s/Language: English/Language: Ukrainian/;" $ILANG/${doc}.1
    done
  else
    echo "Producing XML of "$doc" for locale "$LANG
    po4a-translate -k 0 --format man --master-charset utf-8 --localized-charset utf-8 \
      --master ./${doc}.1 \
      --po $LANG.po --localized $LANG/${doc}.1
    perl -i -p -e "s/Language: English/Language: Ukrainian/;" $ILANG/${doc}.1
  fi
done
