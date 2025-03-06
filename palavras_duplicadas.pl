#! /usr/bin/perl
use experimental 'smartmatch';

@lista1=("teste", "palavra", "cachorro");
@lista2=("gato", "coelho", "cachorro", "rato", "teste");
@lista3 = ();

foreach (@lista1){
    if ($_ ~~ @lista2){
        push(@lista3, $_);
    }
}

print "As palavras duplicadas são: " . join(", ", @lista3) . "\n";

exit;