#! /usr/bin/perl

# Esse script gera um novo arquivo no formato fasta com o complemento reverso das sequências.
# No novo arquivo, a descrição das sequências é apenas o nome do gene.

$input  = $ARGV[0];
$output = $ARGV[1];

open(SEQ, "<$input")  || die "Nao foi possivel abrir o arquivo $input\n";
open(OUT, ">$output") || die "Nao foi possivel abrir o arquivo $output\n";


# Loop nas linhas do arquivo de sequencias
while (<SEQ>) {
    # Removemos quebra de linhas em cada linha
    chomp;

    # Se a linha começar com um ">" então é linha de ID
    # Caso contrario, geramos o complemento reverso
    if($_ =~ /^>/){
        $offset = index($_, "name=");
        $str = substr($_, $offset);
        ($nome = $str) =~ s/;(.*)//;
        print OUT "$nome\n";
    } else{
        $rev_dna = reverse($_);
        $rev_dna =~ tr/ATGCatgc/TACGtacg/;
        print OUT "$rev_dna\n";
    }
}

close SEQ;
close OUT;

exit;