#! /usr/bin/perl
#exemplo01

# $valor como variavel global

$valor = 0;
print "Antes da subrotina, valor \= $valor.\n";

soma(12, 20);

print "Depois da subrotina, valor \= $valor.\n";
exit;

sub soma {
    ($n1, $n2) = @_;
    my $valor = $n1 + $n2;
    print "Dentro da subrotina, valor \= $valor.\n";
}