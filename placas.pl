#! /usr/bin/perl
#exemplo01 - placas.pl

print "Placa\:";

$placa = <STDIN>;
chomp($placa);

if ($placa =~ /[A-Za-z][A-Za-z][A-Za-z][0-9][0-9][0-9][0-9]/) {print "Possui sete caracteres!\n"}

if ($placa =~ /[A-Za-z]{3}[0-9]{4}/) {print "Possui sete caracteres!\n"}

exit;