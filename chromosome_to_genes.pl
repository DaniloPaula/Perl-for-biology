#! /usr/bin/perl

# script para retornar a cobertura desse cromossomo e o número de genes
# APENAS SE a cobertura for maior ou igual a 20

# criando o hash de cobertura
%cobertura = ("1", 80,
                "2", 79,
                "3", 65,
                "4", 62,
                "5", 59,
                "6", 55,
                "7", 52,
                "8", 47,
                "9", 46,
                "10", 44,
                "11", 44,
                "12", 43,
                "13", 37,
                "14", 35,
                "15", 33,
                "16", 29,
                "17", 26,
                "18", 25,
                "19", 21,
                "20", 20,
                "21", 15,
                "22", 16,
                "X", 50,
                "Y", 19);

# criando o hash de genes
%genes = ("1", "2000",
            "2", "1300",
            "3", "1000",
            "4", "1000",
            "5", "900",
            "6", "1000",
            "7", "900",
            "8", "700",
            "9", "800",
            "10", "700",
            "11", "1300",
            "12", "1100",
            "13", "300",
            "14", "800",
            "15", "600",
            "16", "800",
            "17", "1200",
            "18", "200",
            "19", "1500",
            "20", "500",
            "21", "200",
            "22", "500",
            "X", "800",
            "Y", "200");

# Entrada do códon
print "Digite o cromossomo desejado: ";
my $cromossomo = uc(<STDIN>);

# Remover newline
chomp($cromossomo);

if (exists $cobertura{$cromossomo}) {
    if ($cobertura{$cromossomo} >= 20) {
        print "O cromossomo $cromossomo tem cobertura de $cobertura{$cromossomo} e o número de genes associados é de $genes{$cromossomo}.\n";
    } else {
        print "O cromossomo não tem cobertura suficiente para a analise pretendida\n";
    }
} else {
    die "Cromossomo não encontrado\n";
}

exit;