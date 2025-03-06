#! /usr/bin/perl
# exemplo01
# foreach() para imprimir conteudo de arrays

@seqs=("ATGGCGTAGATCG", "TAAGCCCCGGTATATTTGACCCCGAT", "GATAGAG");

print "\nExemplo 01:\n";

$i = 1;

foreach $seq (@seqs) {
    print ">Gene $i\n$seq\n\n";
    $i++
}

# exemplo03
# foreach() para imprimir conteudo de hashes

%seqs = ("Gene25", "ATGGCGTAGATCG",            
         "Gene49", "TAAGCCCCGGTATATTTGACCCCGAT", 
         "Gene03", "GATAGAG",
         "Gene98", "GATAGAG");
       
print "\nExemplo 03:\n";

foreach (sort(keys(%seqs))) {
    print ">$_\n$seqs{$_}\n\n";
}

# exemplo 05
# foreach() para encontrar um valor especifico em hashes

print "\nExemplo 05:\n";

$seq_alvo = "GATAGAG"; # esta presente?

foreach $gene (keys(%seqs)) {
    if ($seqs{$gene} eq $seq_alvo) {
        print "Sequencia encontrada: $gene.\n\n";
        # last finaliza o loop entao ele pega somente o primeiro elemento encontrado
        last;
    }
}

# exemplo 06

# for vs. while

print "\nExemplo 06:\n";

# for
for ($i = 0; $i < 5; $i++) {
   print "$i\n";
}

# while
$i = 0;

while ($i < 5) {
  print "$i\n";
  $i++;
}

# exempl007 
# formas de imprimir arrays

@seqs = ("ATGGCGTAGATCG","TAAGCCCCGGTATATTTGACCCT", "GATAGAG");

# for
$seqs = @seqs;

print "\nExemplo 07 (for):\n";

for ( $i = 0; $i < $seqs; $i++ ) {
    print "$seqs[$i]\n" ; 
}

# foreach 

print "\nExemplo 07 (foreach):\n";

foreach $seq (@seqs) {
    print "$seq\n" ; 
}

# while
$n_seqs = @seqs;

$i = 0;

print "\nExemplo 07 (while):\n";

while ( $i < $n_seqs ) {
   print "$seqs[$i]\n";
   $i++;
}

exit;