#!/usr/bin/perl -w
# basic2csv.pl - reformat IC basic amateur question bank output
# scruss / VA3PID - 2014-03-07 - WTFPL

use warnings;
use strict;
use utf8;
use Text::CSV_XS;

$/ = "\nB-00";
my @answers = ();
my @fields =
  qw/question_id right_answer question answerA answerB answerC answerD/;

while (<>) {
    my %h = ();
    s/^/B-00/m unless (/^B-00/);
    s/\nB-00$//m;
    my @lines = grep( !/^$/, split( "\n", $_ ) );

    # now split out the question content
    $h{'question_id'} = substr( $lines[0], 0, 13 );
    ( $h{'right_answer'} ) = $lines[0] =~ /\(([ABCD])\)/;

    # now look for answer start lines: "^A  ", "^B  ", ...
    my %qpositions = ();
    foreach my $qheader (qw/A B C D/) {
        my $keyletter = join( '', $qheader, '  ' );
        my $l = 0;
        for ( $l = 0 ; $l <= $#lines ; $l++ ) {
            if ( substr( $lines[$l], 0, 3 ) eq $keyletter ) {

                # we found a question start line
                $qpositions{$qheader} = $l;
                $lines[$l] =~ s/^[ABCD]  //;
            }
        }
    }
    map { s/^\s+//; } @lines;
    $h{'question'} = join( ' ', @lines[ 1 .. ( $qpositions{'A'} - 1 ) ] );
    $h{'answerA'} =
      join( ' ', @lines[ $qpositions{'A'} .. ( $qpositions{'B'} - 1 ) ] );
    $h{'answerB'} =
      join( ' ', @lines[ $qpositions{'B'} .. ( $qpositions{'C'} - 1 ) ] );
    $h{'answerC'} =
      join( ' ', @lines[ $qpositions{'C'} .. ( $qpositions{'D'} - 1 ) ] );
    $h{'answerD'} = join( ' ', @lines[ $qpositions{'D'} .. $#lines ] );
    push @answers, \%h;
}

# now output everything as CSV
$/ = "\n";
my $csv = Text::CSV_XS->new(
    {
        always_quote => 1,
        binary       => 1,
    }
);

$csv->column_names(@fields);
$csv->print( *STDOUT, \@fields );    # print csv header
print "\n";
foreach (@answers) {                 # print all the rows
    $csv->print_hr( *STDOUT, $_ );
    print "\n";
}
exit;
