#! /usr/bin/perl
#exemplo04

$output = $ARGV[0];

open(OUTPUT, ">$output") || die "Nao foi possivel abrir $output\n";

print OUTPUT "Escrevendo no arquivo usando OUTPUT\n";

print "Onde estou escrevendo sem filehandle?\n";
print STDERR "Onde estou escrevendo com STDERR?\n";
print STDOUT "Onde estou escrevendo com STDOUT?\n";

close OUTPUT; 
exit;