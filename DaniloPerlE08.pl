#! /usr/bin/perl

## --------------------------------------------------------------------- ##
##                                                                       ##
##  SCRIPT: DaniloPerlE08.pl                                19.11.2021   ##
##                                                                       ##
##  DESCRIPTION: script para converter arquivo no formato FASTA para     ##
##               FASTAQ com sitios                                       ##
##                                                                       ##
##  USAGE: perl DaniloPerlE08.pl                                         ##
##              arquivoSequencias.fasta arquivoQualidades.fasta          ##
##              arquivoSequenciasComSitio.fastq                          ##
##                                                                       ##
##                                                                       ##
##  AUTHOR: Danilo de Paula Perl                                         ##
##                                                                       ##
## --------------------------------------------------------------------- ##

use strict;

my $input1  = $ARGV[0];
my $input2  = $ARGV[1];
my $output = $ARGV[2];

open(my OUT, ">$output") || die "Nao foi possivel abrir o arquivo $output\n";

my ($hashSEQ, $hashQUAL) = fasta2hash($input1, $input2);


close OUT;

exit;

## SUBROTINAS ##

## subrotina para ler sequências (e qualidades) no formato FASTA e armazenar em dois hashes: %seq e %qual
## argumento: duas strings com sequencias e qualidades
## retorna: dois hashes com sequencias e qualidades

sub fasta2hash {
    open(my SEQ, "<$input1")  || die "Nao foi possivel abrir o arquivo $input1\n";
    open(my QUAL, "<$input2")  || die "Nao foi possivel abrir o arquivo $input2\n";

    my $id = "";
    my %seq = ();
    my %qual = ();

    # Loop nas linhas do arquivo de sequencias
    while (<SEQ>) {
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
    while (<QUAL>) {
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

    close SEQ;
    close QUAL;

    # Referencias podem salvar um pouco de memoria
    return (\%seq, \%qual);
}