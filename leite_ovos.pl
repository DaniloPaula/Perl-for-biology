#! /usr/bin/perl

# Há ovos no mercado?

print "Tem ovos no mercado? (S/N): ";
my $answer = uc(<STDIN>);

# Remover newline
chomp($answer);

if ($answer eq "S"){
    print "Traga 6 litros de leite.\n";
} elsif ($answer eq "N") {
    print "Traga 1 litro de leite.\n";
} else {
    die "Resposta inválida.\n";
}

exit;