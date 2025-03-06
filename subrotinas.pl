#! /usr/bin/perl
#exemplo01
# Descobrir a funcao da subrotina abaixo
# A funcao rand(EXPR) retorna um numero real entre 0 e o valor de EXPR
# A funcao int(EXPR) retorna a parte inteira do valor real EXPR (nao arredonda)

seqAleatoria(100);
exit;

sub seqAleatoria {
    $tamanho = $_[0];
    for ($i = 0; $i < $tamanho; $i++) {
        $base = int(rand(4));
        if ($base == 0) { 
            print "A"; 
            next;
        }
        if ($base == 1) {
            print "T";
            next;
        }
        if ($base == 2) {
            print "C";
            next;
        }
        if ($base == 3) {
            print "G";
            next;
        }
    }
    print "\n"; 
}