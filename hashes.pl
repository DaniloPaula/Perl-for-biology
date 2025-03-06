#! /usr/bin/perl
# exemplo01
# script para entender hashes

# criando o hash de genes
%genes = ("FBgn0033056", "CG7856",
          "FBgn0037888", "scpr-B",
          "FBgn0034742", "CG424",
          "FBgn0032640", "Sgt",
          "FBgn0259204", "CG42308",
          "FBgn0039821", "CG15556",
          "FBgn0038957", "CG7059",
          "FBgn0037609", "CG9773");

# acessando os elementos individuais do hash
$gene01 = $genes{FBgn0033056};
$gene02 = $genes{FBgn0037888};

print "$gene01 e $gene02\n";

# criar uma nova entrada
$genes{"FBgn0051118"} = "RabX4";

$gene01 = $genes{FBgn0051118};

print "$gene01\n";

# recuperar os IDs
@gene_IDs = keys(%genes);

print "@gene_IDs\n";

# recuperar os valores
@gene_Values = values(%genes);

print "@gene_Values\n";

# recuperar os IDs em ordem alfabetica
@gene_IDs = sort(keys(%genes));

print "@gene_IDs\n";
exit;
