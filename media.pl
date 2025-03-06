#! /usr/bin/perl
# exemplo04
# calcular a media de tamanho das sequencias em um array

@seqs = ("ATGGCGTAGATCG", "TAAGCCCCGGTATATTTGACCCCGAT", "GATAGAG");

# Passo 1: acessar elementos do array, calcular e armazenar comprimentos

$tamanho = length(@seqs[0]) + length(@seqs[1]) + length(@seqs[2]);

# Passo 2: calcular a media

$media = $tamanho/@seqs;

# Passo 3: Imprimir resultado

print "\nExemplo 04:\n";

print "Media de tamanho = $media\n";

exit;