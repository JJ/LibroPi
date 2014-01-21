#!/usr/bin/perl

use strict;
use warnings;

use v5.12;

use File::Slurp;

my @name_of_digits = qw( zero one two three four five six seven eight nine );

my @plural_ligatures= (" followed by "," and ",", after ",
		       " and, behind them, ",", after these ",
		       " after which we can find ",
		       " and, coming up ",", ", ", wait for it, ", 
		       ", and, in a completely unexpected way " );

my @singular_ligatures= (" followed by "," and ",", after ",
			 " and, behind it, ",", after this ",
			 " after which we find "," and, coming up ",
			 ", ", ", wait for it, ", 
			 ", and, in a rather surprising way ", 
			 " which is right before " );

my $file_name= shift || '9999pi.txt';
my $digits;

if ( -r $file_name ) {
    $digits = read_file($file_name);
} else {
    die "Can't read $file_name, sorry";
}



# Sólo hay una aparción de 6 dígitos seguidos, y es de nueves
$digits=~ s/\.//; # That's the period after the first 3 in 3.14
$digits=~ s/999999/" the one and only six contiguous digits, which happen to be no less than six nines ".random_plural()." "/eg;

for my $i (qw( 5 4 3 2) ) {
  for my $j ( 0.. 9 ) {
    my $re = $j."{".$i."}";
    $digits =~ s/$re/$name_of_digits[$i]." ".$name_of_digits[$j]."s".random_plural()/eg;
  }
}

for my $j ( 0.. 9 ) {
  $digits =~ s/$j/"one ".$name_of_digits[$j].random_singular()/eg;
}

say ucfirst($digits)." lots of other guys it would take too long (infinitely so, indeed) to even consider.";

# Here come the functions

sub random_plural {
  return @plural_ligatures[ rand( @plural_ligatures ) ];
}

sub random_singular {
  return @singular_ligatures[ rand( @singular_ligatures ) ];
}


__DATA__

=head1 NAME

tell_me_pi.pl - Convert a sequence of digits into a textual description

=head1 SYNOPSIS

Work over the default file, C<pi9999.txt>

    % tell_me_pi.pl 

Use another file

    % tell_me_pi.pl text_file_with_endless_numbers.txt

=head1 DESCRIPTION  

Simple script to convert a succession of digits into a textual
    description  such as 

    1223 -> that's an one and two twos followed by one three

which can be used to write the first nine thousand nine hundred and
    ninety nine digits of pi. Initial idea at L<http://www.psicobyte.com/articulo/mi_novela>

=head1 AUTHOR

Created by Pablo Hinojosa, L<mailto:psicobyte@gmail.com>, modified by J. J. Merelo. Original repo is at L<http://github.com/psicobyte/LibroPi>

=cut

=head1 Copyright

       CopyRight 2012 Allan Psicobyte (psicobyte@gmail.com)

       This program is free software: you can redistribute it and/or modify
       it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 3 of the License, or
       (at your option) any later version.

       This program is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       GNU General Public License for more details.

       You should have received a copy of the GNU General Public License
       along with this program.  If not, see <http://www.gnu.org/licenses/>.
