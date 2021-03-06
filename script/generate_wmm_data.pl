use warnings;
use strict;

use Data::Dump qw(dd);

my $file = -e 'script/WMM.COF' ? 'script/WMM.COF' : 'WMM.COF';

open my $fh, '<', $file or die $!;

my @wmm;

while (my $line = <$fh>){
    if ($. == 1) {
        push @wmm, [];
        next;
    }

    last if $line =~ /^99999999/;

    $line =~ s/^\s+//;

    my ($current_list, $list_position, @wmm_data) = split /\s+/, $line;

    push @{ $wmm[$current_list]->[$list_position] }, @wmm_data;
}

for (@wmm){
    for my $inner (@{ $_}){
        print "$inner\n";
    }
}

dd \@wmm;
