#! /usr/bin/perl 

# Inicialização de um array vazio
@arr_seq = ();

# Dado que a priori sabemos que o tamanho do array é 3, definimos um for loop
for (1 .. 3){
	# Entrada do i-esimo identificador
	print "Digite o identificador da sequência: ";
    my $id = <STDIN>;
    chomp $id;
    
    # Formatação do i-esimo identificador para colocar no formato do cabeçalho do FASTA
    $id = ">" . $id . "\n";
    
	# Entrada da i-esima sequência
	print "Digite a sequência: ";
    my $seq = <STDIN>;
    chomp $seq;
    $seq = $seq . "\n";
    
    # Concatenamos cada tupla (id e sequencia) em string e adicionamos ao array
    push @arr_seq, $id . $seq;
}

# Retornamos as sequências em formato fasta na ordem inversa
print reverse(@arr_seq);

# Exportar para o arquivo output.FASTA
open my $file, '>', 'output.FASTA';
print {$file} reverse(@arr_seq);
close $file;

exit;
