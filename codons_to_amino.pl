#! /usr/bin/perl

# script para retornar o amino relativo a um codon

# criando o hash de códons
%codons = ("UUU", "FenilAlanina",
            "UUC", "FenilAlanina",
            "UUA", "Leucina",
            "UUG", "Leucina",
            "UCU", "Serina",
            "UCC", "Serina",
            "UCA", "Serina",
            "UCG", "Serina",
            "UAU", "Tirosina",
            "UAC", "Tirosina",
            "UAA", "Ocre",
            "UAG", "Âmbar",
            "UGU", "Cisteína",
            "UGC", "Cisteína",
            "UGA", "Opala",
            "UGG", "Triptofano",
            "CUU", "Leucina",
            "CUC", "Leucina",
            "CUA", "Leucina",
            "CUG", "Leucina",
            "CCU", "Prolina",
            "CCC", "Prolina",
            "CCA", "Prolina",
            "CCG", "Prolina",
            "CAU", "Histidina",
            "CAC", "Histidina",
            "CAA", "Glutamina",
            "CAG", "Glutamina",
            "CGU", "Arginina",
            "CGC", "Arginina",
            "CGA", "Arginina",
            "CGG", "Arginina",
            "AUU", "IsoLeucina",
            "AUC", "IsoLeucina",
            "AUA", "IsoLeucina",
            "AUG", "Metionina",
            "ACU", "Treonina",
            "ACC", "Treonina",
            "ACA", "Treonina",
            "ACG", "Treonina",
            "AAU", "Asparagina",
            "AAC", "Asparagina",
            "AAA", "Lisina",
            "AAG", "Lisina",
            "AGU", "Serina",
            "AGC", "Serina",
            "AGA", "Arginina",
            "AGG", "Arginina",
            "GUU", "Valina",
            "GUC", "Valina",
            "GUA", "Valina",
            "GUG", "Valina",
            "GCU", "Alanina",
            "GCC", "Alanina",
            "GCA", "Alanina",
            "GCG", "Alanina",
            "GAU", "Ácido aspártico",
            "GAC", "Ácido aspártico",
            "GAA", "Ácido glutâmico",
            "GAG", "Ácido glutâmico",
            "GGU", "Glicina",
            "GGC", "Glicina",
            "GGA", "Glicina",
            "GGG", "Glicina");

# Entrada do códon
print "Digite o códon desejado: ";
my $codon = uc(<STDIN>);

# Remover newline
chomp($codon);

if (exists $codons{$codon}) {
    print "O aminoacido do códon $codon é $codons{$codon}.\n";
} else {
    die "Códon não encontrado\n";
}

exit;