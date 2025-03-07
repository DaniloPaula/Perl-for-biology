#! /usr/bin/perl
# exemplo02
# script para testar a função defined

# criando variáveis

$scalar1 = 1;
$scalar2 = 0;
$scalar3 = "";
$scalar4; 

$temp = defined($scalar4);
print "Resultado do defined = $temp\n\n";

# exemplo03
# comandos testar a função undef

$temp1 = defined($scalar1); ## TRUE
print "Resultado do defined \(temp1\) = $temp1\n";

$temp2 = undef($scalar1);   ## FALSE
print "Resultado do defined \(temp2\) = $temp2\n\n";

# exemplo04
# testando operacoes matematicas 
# comparacao 1
my $c = 5;
my $e = 5;
my $d = 20;

$temp = $c == $e; 
print "A comparacao 1 eh $temp.\n"; 

# comparacao 2

$temp = $c == $d; 
print "A comparacao 2 eh $temp.\n"; 

# comparacao 3

$temp = $c <= $d; 
print "A comparacao 3 eh $temp.\n"; 

# comparacao 4

$temp = $c <=> $d; 
print "A comparacao 4 eh $temp.\n"; ## -1, 0, 1

# comparacao 5 - contexto de "string"

$temp = $c eq $d; 
print "A comparacao 5 eh $temp.\n"; 

# comparacao 6 - contexto de "string"

$temp = $c gt $d; 
print "A comparacao 6 eh $temp.\n"; 

# comparacao 7 - contexto de "string"

$temp = $c cmp $d; 
print "A comparacao 7 eh $temp.\n"; ## -1, 0, 1

# comparacao 8 - contexto de "string"
# ordem alfabética

$geneA = "FBgn2";
$geneB = "FBgn100";

$temp = $geneA cmp $geneB; 
print "A comparacao 8 eh $temp.\n"; 

# comparacao 9 - contexto de "string"
# ordem alfabética

$geneA = "FBgn002";
$geneB = "FBgn100";

$temp = $geneA cmp $geneB; 
print "A comparacao 9 eh $temp.\n";

exit;
