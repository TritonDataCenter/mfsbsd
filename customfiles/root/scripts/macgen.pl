#!/usr/bin/env perl

use strict;

my $N_macs  = shift;  # number of mac addresses
my $addr    = shift;  # address
my $mac     = "56:00:01:02:03:%02x";
my $gen;

my @a = split(/\./,$addr);



map {
     $gen  = sprintf $mac,$a[3]+$_ ;
     printf "arp -s %s %s\n",
           join(".",@a[0..2],$a[3]+$_),$gen;

} (1 .. $N_macs);
