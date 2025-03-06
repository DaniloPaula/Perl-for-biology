#! /usr/bin/perl
#exemplo05

$input  = $ARGV[0];
$output = $ARGV[1];

open(SEQ, "<$input")  || die "Nao foi possivel abrir o arquivo $input\n";
open(OUT, ">$output") || die "Nao foi possivel abrir o arquivo $output\n";

while (<SEQ>) {
   print OUT $_; 
}

close SEQ;

exit;