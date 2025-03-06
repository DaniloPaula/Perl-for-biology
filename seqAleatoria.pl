#! /usr/bin/perl
#exemplo02

# gerar sequencia aleatoria com a subrotina seqAleatoria
$tamanho = 200;
$sequencia = seqAleatoria($tamanho);

# inverter a sequencia
$revSeq = reverse($sequencia);

# gerar o complemento reverso
$revSeq =~ tr/ATCG/tcga/;

# imprimir (fasta)
print "\>seq\n";
for ($i = 0; $i < $tamanho; $i+=70) { 
    print substr($revSeq,$i,70), "\n"; 
}

exit;

sub seqAleatoria {
    $seq = "";
    $tamanho = shift || 40;
    for ($i = 0; $i < $tamanho; $i++) {
        $base = int(rand(4));
        if ($base == 0) { $seq .="A";; next; }
        if ($base == 1) { $seq .="T";; next; }
        if ($base == 2) { $seq .="C";; next; }
        if ($base == 3) { $seq .="G";; next; }
    }
    return $seq;
}