#! /usr/bin/perl 
#exemplo01 - hello.pl
# Meu primeiro script

use Time::Piece;

# Entrada do nome
print "Qual o seu primeiro nome? ";
my $nome = <STDIN>;

# Entrada do sobrenome
print "Qual o seu sobrenome? ";
my $sobrenome = <STDIN>;

# Remover newline
chomp($nome);
chomp($sobrenome);

# ReGex colocar todas as primeiras letras de para varios sobrenomes maiusculas
$sobrenome =~ s/(\S+)/\u\L$1/g;

print "Hello, \u$nome $sobrenome!\n";

my $t = localtime;
my $todays_date = "A data da utilização deste programa é: " . $t->strftime('%d/%m/%y') . "\n";

print $todays_date;

exit;
