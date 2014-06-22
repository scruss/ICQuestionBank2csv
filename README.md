ICQuestionBank2csv
==================

A tool to extract both the Basic and Advanced Amateur Radio
Examination guides from Industry Canada's rather annoying two-column
PDFs. Written for IC's 2014-02 database updates.

Please note that, while Industry Canada appears to update the examination question guide quite frequently, most of the effort looks like it's going into reordering the answers. There can be little reason for this beyond trying to track copies of the database as they appear on the web, or to confound easy tracking of error correction of the database. It would be a SMOP to create a normalizer for the data to sort the answers, reassign the correct one, and put out a consistent database every time. 

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

## Bugs ##

Doubtless there are some, but the main issue is that the scripts are trivial modifications of one another.

## Licence ##

WTFPL (srsly).

