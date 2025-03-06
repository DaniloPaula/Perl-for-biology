#! /usr/bin/perl

%alunos = ("Joao", "985314759",            
         "Joaozinho", "985314758", 
         "Mateus", "985314757",
         "Carlos", "985314756");

$nome = "Joaozinho"; # esta presente?

foreach (keys(%alunos)) {
    if ($_ eq $nome) {
        die "O NUSP do $_ é $alunos{$_}.\n";
    }
}

print "$nome nao esta na turma.\n";

exit;