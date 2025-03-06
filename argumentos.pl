#! /usr/bin/perl
#exemplo03

## script para testar subrotinas

use strict;

# declaracao e inicializacao de variaveis
my $sequencia;
my @nome = ("EcoRI", "HaeII", "HindIII"); 
my @sitio = ("GAATTC", "GGCC", "AAGCTT"); 

## MAIN ##

$sequencia = restricao($#nome, @nome, $#sitio, @sitio);
my $ref = \@nome;
print "REF eh $ref\n";
exit;

## SUBROTINAS ##

sub restricao {
    my @nome;
    my @sitio;

    my $lastindex = shift;
    for (my $i = 0; $i <= $lastindex; $i++) {
        $nome[$i] = shift;
    }
    $lastindex = shift;
    for (my $i = 0; $i <= $lastindex; $i++) {
        $sitio[$i] = shift; 
    }
    # bloco de comandos para usar os arrays
    print "@nome\n";
    print "@sitio\n";
}