#! /usr/bin/perl 

# Entrada de a
print "Digite o valor de a: ";
my $a = <STDIN>;

# Entrada de b
print "Digite o valor de b: ";
my $b = <STDIN>;

# Entrada de c
print "Digite o valor de c diferente de 0: ";
my $c = <STDIN>;

# Remover newline
chomp($a);
chomp($b);
chomp($c);

if($c == 0){
   print("C não pode ser zero!\n");
}else{
	$formula = (sqrt(($a + $b)**2))/$c;
	print("O valor calculado é $formula.\n");
}

exit;
