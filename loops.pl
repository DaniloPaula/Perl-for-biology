#! /usr/bin/perl
# exemplo06
# calcular a media de tamanho das sequencias em um array

# exemplo06 
# for() para imprimir conteudo de arrays

@seqs = ("ATGGCGTAGATCG", "TAAGCCCCGGTATATTTGACCCCGAT", "GATAGAG");

$seqs = @seqs; #numero de elementos do array

print "Exemplo 06:\n";

print "Numero de sequencias = $seqs\n";

$tamanho = 0;

# Passo 1: acessar elementos do array, calcular e armazenar comprimentos
for ($i = 0; $i < $seqs; $i++) {
    $tamanho += length($seqs[$i]);
}  

# Passo 2: calcular a media
$media = $tamanho/$seqs;

# Passo 3: Imprimir resultado
print "Media de tamanho = $media\n";

exit;