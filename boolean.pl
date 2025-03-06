#! /usr/bin/perl
# exemplo01
# operadores booleanos &&, ||  

%coord_start = ("Gene1" => "100000",
                "Gene2" => "550000");
%coord_end   = ("Gene2" => "556000");

$gene_alvo = "Gene1";

if (($coord_start{$gene_alvo}) || ($coord_end{$gene_alvo})) {
   print "As coordenadas do $gene_alvo sao $coord_start{$gene_alvo}..$coord_end{$gene_alvo}. \n"; 
}


exit;