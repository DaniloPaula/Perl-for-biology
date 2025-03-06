#! /usr/bin/perl 
# script para testar operacoes matematicas
# exemplo02
# testando
$a = 1;
print "Atribuicao\:             \$a \= $a\n"; 

++$a;
print "Auto\-acrescimo\:         \$a \= $a\n"; 

--$a;
print "Auto\-decrescimo\:        \$a \= $a\n"; 

$b = 3 + 1;
print "Soma\:                   \$b \= $b\n";

$c = $a + $b;
print "Soma\:                   \$c \= $c\n";

$d = $b * $c;
print "Multiplicacao\:          \$d \= $d\n";

$e = $d / $b;
print "Divisao\:                \$e \= $e\n";

$f = sqrt($b);
print "Raiz quadrada\:          \$f \= $f\n";

$g = ($a + $b) * $c;
print "Equacao\:                \$g \= $g\n";

$h = $g  % 2;
print "Modulo\:                 \$h \= $h\n";

$i = $d % $b;
print "Modulo\:                 \$i \= $i\n";

$j = $c ** $f;
print "Potenciacao\:            \$j \= $j\n";

$j += 5;
print "Adicao e atribuicao\:    \$j \= $j\n";

$j -= $e;
print "Subtracao e atribuicao\: \$j \= $j\n";


exit;
