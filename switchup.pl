#!/usr/bin/perl
# I use this script on unmanaged switches for nagios.
# switchup.pl 192.168.1.2 192.168.1.3 192.168.1.10 192.168.1.23
# if one IP responds, the switch is up, if none of the IPs respond,
# the switch is down.


use strict;
use warnings;

foreach(@ARGV) {
	my $output = `fping $_ >/dev/null 2>&1`;
	if( $? == 0 ) {
		print("SWITCH OK\n");
		exit(0);
	}
}

print("SWITCH CRITICAL\n");
exit(2);

