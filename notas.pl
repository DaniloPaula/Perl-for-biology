#! /usr/bin/perl 
# exemplo03 
# nota <  5,   reprovado 
# nota <= 7,   C
# nota <= 8.5, B
# nota >  8.5, A
# varias condicoes diferentes

$nota_do_aluno = 10.0;
$nota_de_corte = 5.0;

print "Exemplo 3:\n";

if ($nota_do_aluno < $nota_de_corte) {
   print "Aluno reprovado!\n";
} elsif ($nota_do_aluno <= 7) { 
    print "C, regular!\n";
} elsif ($nota_do_aluno <= 8.5) { 
    print "B, bom!\n";
} else {
    print "A, excelente!\n";
}

exit;