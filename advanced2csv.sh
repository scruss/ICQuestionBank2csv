#!/bin/bash
# advanced2csv - convert IC advanced question data bank to usable CSV
# scruss / VA3PID - 2014-03-07 - WTFPL

INFILE=amateur_advanced_questions_en.pdf
if
    [ ! -f $INFILE ]
then
    wget http://apc-cap.ic.gc.ca/datafiles/$INFILE
fi
txtdump="$(mktemp)"

# 62 page PDF. Questions start on page 3
# Page size: 612 × 792 pt
# two cols:
#   1)   0-249 pt
#   2) 250-611 pt

for page in $(seq 3 1 62)
do
    pdftotext -layout -f $page -l $page -r 72 -x 0 -y 0 -W 250 -H 792 $INFILE - | sed 's/\x0C/\x0A/g;' >> $txtdump
    pdftotext -layout -f $page -l $page -r 72 -x 250 -y 0 -W 542 -H 792 $INFILE - | sed 's/\x0C/\x0A/g;' >> $txtdump
done

./advanced2csv.pl $txtdump > ${INFILE%.pdf}.csv
rm -r $txtdump
