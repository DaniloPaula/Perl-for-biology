#! /usr/bin/perl
#exemplo02

## --------------------------------------------------------------------- ##
##                                                                       ##
##  SCRIPT: seqAleatoria.pl                                 04.11.2021   ##
##                                                                       ##
##  DESCRIPTION: script para exemplificar subrotinas                     ##
##                                                                       ##
##  USAGE: perl seqAleatoria.pl                                          ##
##                                                                       ##
##  AUTHOR: Tatiana Torres    tttorres at ib.usp.br                      ##
##                                                                       ##
## --------------------------------------------------------------------- ##

use lib '/mnt/d/Projetos/BIO0454/';
use strict; 
use aula14;

## Declaracao de variaveis

my $tamanho;
my $sequencia;
my $revSeq;

## MAIN ##

# criar a sequencia aleatoria
$tamanho = 200;
$sequencia = seqAleatoria($tamanho);

# inverter a sequencia
$revSeq = reverse($sequencia);

# gerar o complemento reverso
$revSeq =~ tr/ATCG/atcg/;

# imprimir (fasta)
print "\>seq\n";
for (my $i = 0; $i < $tamanho; $i+=70) { print substr($revSeq,$i,70), "\n"; }

exit;