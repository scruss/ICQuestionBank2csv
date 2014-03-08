ICQuestionBank2csv
==================

A tool to extract both the Basic and Advanced Amateur Radio
Examination guides from Industry Canada's rather annoying two-column
PDFs. Written for IC's 2014-02 database updates.

See: [Amateur Radio Exam Generator](http://www.ic.gc.ca/eic/site/025.nsf/eng/h_00040.html "Amateur Radio Exam Generator").

Written by Stewart C. Russell (aka scruss) / VA3PID - 2014-03-07.

## Requirements ##

* Perl, with Text::CSV_XS ≥ version 1.01
* xpdf tools
* Bash
* wget

If the script fails with `Can't locate object method "print_hr" via package "Text::CSV_XS" …`, your Text::CSV_XS is too old. This currently affects Debian Wheezy (particularly noted under Raspbian).

## Usage ##

Run either `basic2csv.sh` or `advanced2csv.sh` to download the source
PDF and extract the data.

## Licence ##

WTFPL (srsly).

