#! /usr/bin/perl
#exemplo02 - telefone.pl

print "Telefone\:";
$tel = <STDIN>;
chomp($tel);

if ($tel =~ /\(?\d{2}\(?\d{4,5}\-?\d{4}/){
    print "Eh um telefone!\n"
}

exit;