#! /usr/bin/perl

$input1  = $ARGV[0];
$input2  = $ARGV[1];
$output = $ARGV[2];

open(SEQ, "<$input1")  || die "Nao foi possivel abrir o arquivo $input1\n";
open(QUAL, "<$input2")  || die "Nao foi possivel abrir o arquivo $input2\n";
open(OUT, ">$output") || die "Nao foi possivel abrir o arquivo $output\n";

# Inicializa variaveis principais
%seq = ();
%qual = ();
$tamanho = 0;

%phred33 = ("0" => "!",
            "1" => "\\",
            "2" => "#",
            "3" => "\$",
            "4" => "%",
            "5" => "&",
            "6" => "'",
            "7" => "(",
            "8" => ")",
            "9" => "*",
            "10" => "+",
            "11" => ",",
            "12" => "-",
            "13" => ".",
            "14" => "/",
            "15" => "0",
            "16" => "1",
            "17" => "2",
            "18" => "3",
            "19" => "4",
            "20" => "5",
            "21" => "6",
            "22" => "7",
            "23" => "8",
            "24" => "9",
            "25" => ":",
            "26" => ";",
            "27" => "<",
            "28" => "=",
            "29" => ">",
            "30" => "?",
            "31" => "@",
            "32" => "A",
            "33" => "B",
            "34" => "C",
            "35" => "D",
            "36" => "E",
            "37" => "F",
            "38" => "G",
            "39" => "H",
            "40" => "I");

# id é usado para capturar o id do gene
$id = "";

# Loop nas linhas do arquivo de sequencias
while (<SEQ>) {
    # Removemos quebra de linhas em cada linha
    chomp;

    # Se a linha começar com um ">" então é linha de ID e substituimos o ">" por "@"
    # Caso contrario, concatenamos as sequencias daquele ID e vamos somando o comprimento
    if($_ =~ /^>/){
        ($id = $_) =~ s/>/@/;
    } else{
        $seq{$id} .= $_;
        $tamanho += length($_);
    }
}

# Calculamos a media
$media = $tamanho/%seq;
print "O tamanho médio das sequências é de: $media\n";

# Loop nas linhas do arquivo de qualidades
while (<QUAL>) {
    # Removemos quebra de linhas em cada linha
    chomp;

    # Se a linha começar com um ">" então é linha de ID e substituimos o ">" por "@"
    # Caso contrario, concatenamos as qualidades daquele ID
    if($_ =~ /^>/){
        ($id = $_) =~ s/>/@/;
        # Remove espaços no fim do ID
        ($id = $id) =~ s/\s*$//;
    } else{
        $qual{$id} .= " " . $_;
    }
}

# Agora vamos iterar nos hash de qualidades para printar no formato
# @GENE
# SEQ
# +
# Encoding em Phred+33 (S - Sanger)
foreach $gene (keys(%qual)){
    print OUT "$gene\n";
    print OUT "$seq{$gene}\n";
    print OUT "+\n";

    # Remove eventuais espaços no inicio e no fim da string de qualidades
    ($quality = $qual{$gene}) =~ s/^\s*(.*?)\s*$/$1/;

    # Transforma o string de qualidades para array com o objetivo de fazer a conversão Phred+33 (S - Sanger)
    @quality_array = split(/\s+/, $quality);
    for ($i = 0; $i < @quality_array; $i++){
        $quality_array[$i] = $phred33{$quality_array[$i]};
    }

    # Juntamos o array em string para escrever a ultima linha
    $quality = join("", @quality_array);
    print OUT "$quality\n";
}

close SEQ;
close QUAL;
close OUT;

exit;