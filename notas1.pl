#! /usr/bin/perl
# exemplo02

($E, $M, $H) = @ARGV;

unless ($#ARGV == 2){
    die "Usage: $0 Nota_P1 Nota_P2 Nota_P3\n";
}
$nota_final = ((2*$E)+(3*$M)+(5*$H))/10;

if ($nota_final >= 5) {
   print "Nota: $nota_final, Aluno aprovado.\n";
} else {
   print "Nota: $nota_final, Aluno reprovado.\n";
}

exit; 