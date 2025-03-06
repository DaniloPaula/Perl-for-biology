#! /usr/bin/perl 
# exemplo08
# Perguntar o nome do usuário
print "Qual seu nome?\n"; 

# Entrada do usuário
my $nome = <STDIN>;

# Remover newline
chomp($nome);

# Cumprimentar o usuário
print "Boa noite, $nome!\n";

exit; 
