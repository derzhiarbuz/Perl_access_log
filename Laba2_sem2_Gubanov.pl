#Губанов А.В.
#гр. 148БИ
#Скриптовые языки, 2 семестр, задание 2

open(FILE,"< access.log");
%ips = ();
while(<FILE>) {
    $_=~m/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/;
    if(not exists $ips{$&}) {
       $ips{$&} = 0; 
    }
    $ips{$&} += 1;
    print;
}
@sortedips = sort {$ips{$b} <=> $ips{$a}} keys %ips;
$n = 10;
if ((scalar @sortedips) < $n) {
    $n = (scalar @sortedips);
}
for($i=0; $i<$n; $i++) {
    print $sortedips[$i], "    -    ", $ips{$sortedips[$i]}, "\n";
}
close(FILE);