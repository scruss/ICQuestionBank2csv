ICQuestionBank2csv
==================

A tool to extract both the Basic and Advanced Amateur Radio
Examination guides from Industry Canada's rather annoying two-column
PDFs. Written for IC's 2014-02 database updates.

See: [Amateur Radio Exam Generator](http://www.ic.gc.ca/eic/site/025.nsf/eng/h_00040.html "Amateur Radio Exam Generator").

Written by Stewart C. Russell (aka scruss) / VA3PID - 2014-03-07.

## Requirements ##

* Perl, with Text::CSV_XS
* xpdf tools
* Bash
* wget

## Usage ##

Run either `basic2csv.sh` or `advanced2csv.sh` to download the source
PDF and extract the data.

## Licence ##

WTFPL (srsly).

