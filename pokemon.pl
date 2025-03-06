#! /usr/bin/perl
# exemplo01 pokemon.pl

unless(@ARGV){
    die "Usage: $0 Pokemon_1 Pokemon_2 Pokemon_3 ... Pokemon_N\n";
}

%evolution = ("Bulbasaur",  "Ivysaur",            
              "Charmander", "Charmeleon", 
              "Squirtle",   "Wartortle",
              "Pikachu",    "Raichu");

$pokemon = "Pikachu";

# usando for
@chaves = keys(%evolution);
$numTotal = @chaves;
$encontrado = 0;

print "\nExemplo 01 (for):\n";

for ($i = 0; $i < $numTotal; $i++) {
    if ($chaves[$i] eq $pokemon) {
        print "Encontrado: $pokemon \-\> $evolution{$pokemon}\n";
        $encontrado = 1;
        last;
    }
}

unless ($encontrado){
    print "Pokemon \"$pokemon\" nao encontrado\n"; 
}

# usando while
# $i = 0;

# print "\nExemplo 01 (for):\n";

# while (@chaves) {
#     $nome = shift(@chaves);
#     if ($nome eq $pokemon) {
#         print "Encontrado: $pokemon \-\> $evolution{$pokemon}\n";
#         $encontrado = 1;
#         last;
#     }
#    $i++;
# }

# usando foreach
foreach $pokemon(@ARGV){
    if ($evolution{$pokemon}) {
        print "$pokemon \= $evolution{$pokemon}\n"; 
    } else {
        print "$pokemon\=NA\n\n";
    }
}

# sem loops
print "\nExemplo 01 (sem loops):\n";

if ($evolution{$infoUsuario}) {
   print "Encontrado: $infoUsuario \-\> $evolution{$infoUsuario}\n" ; 
} else {
   print "Pokemon \"$infoUsuario\" nao encontrado\n"; 
}

exit;