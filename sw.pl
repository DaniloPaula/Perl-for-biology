#! /usr/bin/perl

# Script para criar uma tabela a partir de dois arquivos de entrada
# USAGE: perl sw.pl personagens.txt primeira.txt saida.txt

# Declaracao e inicializacao de variaveis
$entrada1;
$entrada2;
$saida;

%hash_especie;
%hash_primeira;
%hash_planeta;

# Abrir os arquivos
$entrada1 = $ARGV[0];
$entrada2 = $ARGV[1];
$saida = $ARGV[2];

open(PLANETAS, "<$entrada1");
open(PRIMEIRA, "<$entrada2");
open(TABELA, ">$saida");

# Leitura dos arquivos
while (<PLANETAS>){
    chomp $_;

    if($_ =~ /^Nome/){
        ($nome = $_) =~ s/Nome: //;
    } elsif($_ =~ /^Espécie/){
        ($especie = $_) =~ s/Espécie: //;

        $hash_especie{$nome} = $especie;
    } elsif($_ =~ /^Planeta/){
        ($planeta = $_) =~ s/Planeta: //;

        $hash_planeta{$nome} = $planeta;
    } else{
        # print "Linha contendo $_ nao identificada.\n";
    }
}

while (<PRIMEIRA>){
    chomp $_;
    
    if($_ =~ /^Nome/){
        ($nome = $_) =~ s/Nome: //;
    } elsif($_ =~ /^Primeira aparicao: /){
        ($primeira = $_) =~ s/Primeira aparicao: //;

        $hash_primeira{$nome} = $primeira;
    } elsif($_ =~ /^Planeta/){
        ($planeta = $_) =~ s/Planeta: //;

        $hash_planeta{$nome} = $planeta;
    } else{
        # print "Linha contendo $_ nao identificada.\n";
    }
}

# Criar tabela com o formato:
# PERSONAGEM ESPECIE PLANETA PRIMEIRA APARICAO

print TABELA "PERSONAGEM\tESPECIE\tPLANETA\tPRIMEIRA APARICAO\n";

# print "PERSONAGEM\tESPECIE\tPLANETA\tPRIMEIRA APARICAO\n";

@nomes = keys(%hash_especie);

foreach $personagem(@nomes){
    print TABELA "$personagem\t$hash_especie{$personagem}\t$hash_planeta{$personagem}\t$hash_primeira{$personagem}\n";
}

exit