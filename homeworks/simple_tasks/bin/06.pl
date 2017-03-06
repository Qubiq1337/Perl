#!/usr/bin/perl

use strict;
use warnings;

=encoding UTF8
=head1 SYNOPSYS

Шифр Цезаря https://ru.wikipedia.org/wiki/%D0%A8%D0%B8%D1%84%D1%80_%D0%A6%D0%B5%D0%B7%D0%B0%D1%80%D1%8F

=head1 encode ($str, $key)

Функция шифрования ASCII строки $str ключем $key.
Пачатает зашифрованную строку $encoded_str в формате "$encoded_str\n"

Пример:

encode('#abc', 1) - печатает '$bcd'

=cut

sub encode {
    my ($str, $key) = @_;
    my $counter=0;
    my $sub;
    if ($key==128){
        print "$str\n";
    }
    elsif($key>128) 
    {
        #ord - символ в цифру
        #chr - число в символ
        while ($key>128) #узнаю смещение и записываю в key
        {
            $key=$key-128;
        }
        while($counter<length($str))
        {
            $sub=substr($str,$counter,1);
            my $x=ord($sub);
            my $y=chr($x+$key);
            print $y;
            ++$counter; 
        }
        print "\n"; #перевод строки
    }
    elsif($key<128)
    {
    	while($counter<length($str))
        {
            $sub=substr($str,$counter,1);
            my $x=ord($sub);
            my $y=chr($x+$key);
            print $y;
            ++$counter; 
        }
        print "\n";
    }
}

=head1 decode ($encoded_str, $key)

Функция дешифрования ASCII строки $encoded_str ключем $key.
Пачатает дешифрованную строку $str в формате "$str\n"

Пример:

decode('$bcd', 1) - печатает '#abc'

=cut

sub decode {
    my ($str, $key) = @_;
    my $counter=0;
    my $sub;
    if ($key==128){
        print "$str\n";
    }
    elsif($key>128) 
    {
        #ord - символ в цифру
        #chr - число в символ
        while ($key>128) #узнаю смещение и записываю в key
        {
            $key=$key-128;
        }
        while($counter<length($str))
        {
            $sub=substr($str,$counter,1);
            my $x=ord($sub);
            my $y=chr($x-$key);
            print $y;
            ++$counter; 
        }
        print "\n"; #перевод строки
    }
    elsif($key<128)
    {
    	while($counter<length($str))
        {
            $sub=substr($str,$counter,1);
            my $x=ord($sub);
            my $y=chr($x-$key);
            print $y;
            ++$counter; 
        }
        print "\n";
    }
}

1;
