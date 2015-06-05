#!/usr/bin/perl

# A quick-and-dirty script to trash facebook notification spam after I got caught in a virus-caused notification storm.
# mailq said it had 22k Requests. Blarg.
# My system is Centos 6 running postfix. YMMV.
#
# License: GPL 2.0
#
# 6/5/2015
#
# Joey Kelly, http://joeykelly.net

my @queue = `grep update+mwannewx /var/spool/postfix/active/*`;

foreach my $queueid (@queue) {
  chomp $queueid;
  $queueid =~ s/Binary file \/var\/spool\/postfix\/active\///;
  $queueid =~ s/ matches//;
  print "postsuper -d $queueid\n";
  system "postsuper -d $queueid";
}
