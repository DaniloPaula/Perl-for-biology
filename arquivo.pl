#! /usr/bin/perl
#exemplo03 

$output1 = $ARGV[0];
$output2 = $ARGV[1];

open(OUTPUT1, ">$output1");
open(OUTPUT2, ">>$output2");

print OUTPUT1 "Escrevendo no arquivo 1\n";
print OUTPUT2 "Escrevendo no arquivo 2\n";

close OUTPUT1; 
close OUTPUT2; 

exit;