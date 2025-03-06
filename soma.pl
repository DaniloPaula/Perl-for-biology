#! /usr/bin/perl
#exemplo03

$valor = soma(12, 20);
$resultado = $valor*5;
print "$resultado\n";
exit;

sub soma {
    ($n1, $n2) = @_;
    $res = $n1 + $n2;
    return $res;
}