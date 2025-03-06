#! /usr/bin/perl

@baralho=("1Paus", "2Paus", "3Paus", "4Paus", "5Paus","6Paus", "7Paus", "8Paus", "9Paus", "10Paus",
        "ValetePaus", "DamaPaus", "ReiPaus",
        "1Ouros", "2Ouros", "3Ouros", "4Ouros", "5Ouros","6Ouros", "7Ouros", "8Ouros",
        "9Ouros", "10Ouros", "ValeteOuros", "DamaOuros", "ReiOuros",
        "1Copas", "2Copas", "3Copas", "4Copas", "5Copas","6Copas", "7Copas", "8Copas",
        "9Copas", "10Copas", "ValeteCopas", "DamaCopas", "ReiCopas",
        "1Espadas", "2Espadas", "3Espadas", "4Espadas", "5Espadas","6Espadas", "7Espadas", "8Espadas",
        "9Espadas", "10Espadas", "ValeteEspadas", "DamaEspadas", "ReiEspadas");

@Huguinho = ();
@Zezinho = ();
@Luizinho = ();

# Dado que o array do baralho ja esta embaralhado,
# Somente precisamos distribuir para cada um dos 3 jogadores as 5 cartas
# Dando 1 carta para cada jogador em ordem
for ($i = 0; $i < 15; $i += 3){
    push(@Huguinho, @baralho[$i]);
    push(@Zezinho, @baralho[$i+1]);
    push(@Luizinho, @baralho[$i+2]);
}

print "A distribuição de 5 cartas para cada jogador foi:\n";
print "Huguinho recebeu " . join(", ", @Huguinho). "\n";
print "Zezinho recebeu " . join(", ", @Zezinho). "\n";
print "Luizinho recebeu " . join(", ", @Luizinho). "\n";

exit;