#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use v5.12;

use File::Slurp::Tiny qw(read_file);

my $pi50 = "31415926535897932384626433832795028841971693993751";

$pi50=~ tr/0123456789/ ▏▞▚▄▔░▒▓█/; 

say $pi50;

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
