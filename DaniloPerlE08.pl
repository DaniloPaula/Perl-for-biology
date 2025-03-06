#! /usr/bin/perl

## ---------------------------------------------------------------------------- ##
##                                                                              ##
##  SCRIPT: DaniloPerlE08.pl                                19.11.2021          ##
##                                                                              ##
##  DESCRIPTION: script para converter arquivo no formato FASTA para            ##
##               FASTAQ com sitios                                              ##
##                                                                              ##
##  USAGE: perl DaniloPerlE08.pl                                                ##
##              arquivoSequencias.fasta arquivoQualidades.fasta                 ##
##              arquivoSequenciasComSitio.fastq                                 ##
##              enzima de restrição                                             ##
## ./DaniloPerlE08.pl Chom-tr.fasta Chom-tr.fasta.qual E08OUTPUT.fastaq GCTT    ##
##  AUTHOR: Danilo de Paula Perl                                                ##
##                                                                              ##
## ---------------------------------------------------------------------------- ##

use strict;

my $input1  = $ARGV[0];
my $input2  = $ARGV[1];
my $output = $ARGV[2];
my $enzima = $ARGV[3];

# Obter os hashes de sequencias e de qualidades
my ($hashSEQ, $hashQUAL) = fasta2hash($input1, $input2);

# Obter o hash contendo o nome e a posição da enzima
my $hashPOSITION = searchEnzyme($hashSEQ, $enzima);

# for (sort keys %{ $hashPOSITION }) {
#     print "$_ => ${ $hashPOSITION }{$_}\n";
# }

# Converter para FASTQ
my $concluido = fasta_to_fastaq($hashPOSITION, $hashSEQ, $hashQUAL, $output);

print("$concluido\n");

exit;

## SUBROTINAS ##

## subrotina para ler sequências (e qualidades) no formato FASTA e armazenar em dois hashes: %seq e %qual
## argumento: duas strings com sequencias e qualidades
## retorna: dois hashes com sequencias e qualidades

sub fasta2hash {
    my ($input1, $input2) = @_;

    open(my $SEQ, "<$input1")  || die "Nao foi possivel abrir o arquivo $input1\n";
    open(my $QUAL, "<$input2")  || die "Nao foi possivel abrir o arquivo $input2\n";

    my $id = "";
    my %seq = ();
    my %qual = ();
    
    # Loop nas linhas do arquivo de sequencias
    while (<$SEQ>) {
        # Removemos quebra de linhas em cada linha
        chomp;
        
        # Se a linha começar com um ">" então é linha de ID e substituimos o ">" por "@"
        # Caso contrario, concatenamos as sequencias daquele ID e vamos somando o comprimento
        if($_ =~ /^>/){
            ($id = $_) =~ s/>/@/;
        } else{
            $seq{$id} .= $_;
        }
    }

    # Loop nas linhas do arquivo de qualidades
    while (<$QUAL>) {
        # Removemos quebra de linhas em cada linha
        chomp;

        # Se a linha começar com um ">" então é linha de ID e substituimos o ">" por "@"
        # Caso contrario, concatenamos as qualidades daquele ID
        if($_ =~ /^>/){
            ($id = $_) =~ s/>/@/;
            # Remove espaços no fim do ID
            ($id = $id) =~ s/\s*$//;
        } else{
            $qual{$id} .= " " . $_;
        }
    }

    close $SEQ;
    close $QUAL;
    
    # Referencias podem salvar um pouco de memoria
    return (\%seq, \%qual);
}

## subrotina para buscar UM sítio de enzima de restrição indicado pelo usuário em todas as sequências. Armazenar o nome das sequências que possuem o sitio de reconhecimento e sua posição na sequências.
## argumento: uma string contendo a enzima de restrição e hash com as sequências
## retorna: hash com o nome das sequências que possuem o sitio de reconhecimento e sua posição nas sequências

sub searchEnzyme {
    my ($seqs, $enzima) = @_;

    my %position = ();
    
    # Loop nas sequencias
    foreach my $seq_name (keys(%$seqs)){
        # Checar se a sequencia contem a enzima com upper case para evitar case sensitive
        # Se conter, alimenta o hash com o nome e a posição onde começa a enzima
        if (index(uc(%$seqs{$seq_name}), uc($enzima)) != -1) {
            $position{$seq_name} = index(uc(%$seqs{$seq_name}), uc($enzima));
        }
    }

    # Referencias podem salvar um pouco de memoria
    return (\%position);
}

## subrotina para converter as sequências COM o sítio indicado e as respectivas qualidades no formato FASTA para formato FASTQ. Gerar um novo arquivo de saída, indicando a posição do sítio na DESCRIÇÃO da sequência.
## argumento: hashes contendo a posição da enzima, sequencias e as qualidades e o nome do arquivo para output
## retorna: output

sub fasta_to_fastaq {
    my ($position, $seqs, $qual, $output) = @_;

    open(my $OUT, ">$output") || die "Nao foi possivel abrir o arquivo $output\n";
    
    my %phred33 = ("0" => "!",
                    "1" => "\\",
                    "2" => "#",
                    "3" => "\$",
                    "4" => "%",
                    "5" => "&",
                    "6" => "'",
                    "7" => "(",
                    "8" => ")",
                    "9" => "*",
                    "10" => "+",
                    "11" => ",",
                    "12" => "-",
                    "13" => ".",
                    "14" => "/",
                    "15" => "0",
                    "16" => "1",
                    "17" => "2",
                    "18" => "3",
                    "19" => "4",
                    "20" => "5",
                    "21" => "6",
                    "22" => "7",
                    "23" => "8",
                    "24" => "9",
                    "25" => ":",
                    "26" => ";",
                    "27" => "<",
                    "28" => "=",
                    "29" => ">",
                    "30" => "?",
                    "31" => "@",
                    "32" => "A",
                    "33" => "B",
                    "34" => "C",
                    "35" => "D",
                    "36" => "E",
                    "37" => "F",
                    "38" => "G",
                    "39" => "H",
                    "40" => "I");

    # Agora vamos iterar nos hash de qualidades para printar no formato
    # @GENE
    # SEQ
    # +
    # Encoding em Phred+33 (S - Sanger)
    my $next_row = $sth->fetch();
    foreach my $gene (keys(%$position)){
        print $OUT "$gene; Position: @$position{$gene}\n";
        print $OUT "@$seqs{$gene}\n";
        print $OUT "+\n";

        # Remove eventuais espaços no inicio e no fim da string de qualidades
        (my $quality = %$qual{$gene}) =~ s/^\s*(.*?)\s*$/$1/;

        # Transforma o string de qualidades para array com o objetivo de fazer a conversão Phred+33 (S - Sanger)
        my @quality_array = split(/\s+/, $quality);
        for (my $i = 0; $i < @quality_array; $i++){
            $quality_array[$i] = $phred33{$quality_array[$i]};
        }

        # Juntamos o array em string para escrever a ultima linha
        $quality = join("", @quality_array);

        print $OUT "$quality\n";
    }

    close $OUT;

    return ("Conversao de FASTA para FASTQ concluida");
}