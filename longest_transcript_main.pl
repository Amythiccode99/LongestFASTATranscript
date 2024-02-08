use strict;
use warnings;

##input the input & output file
print " Enter the name of the input FASTA file- \n";
my $input = <STDIN>;
chomp $input;

print " Enter the name of the output FASTA file- \n";
my $output = <STDIN>;
chomp $output;




##reading input file
open (INPUT,"<", $input) or die "Cannot open input file" ;
#reading output file
open (OUTPUT , ">", $output);
##reading transcript detail file
open (DETAIL , ">>","details.txt" ) or die "Cannot open details file" ;

##Initiailise the desired transcript and its length

my $transcriptname = '';
my $transcriptmax = 0;
my $finalresult = '' ;

##to process each sequence and their headers in the input file

my $header  = '';
my $sequence = '';


while (<INPUT>) {
	chomp;
	if (/^>(\S+)\s.*$/) {
		
		if (length($sequence) > $transcriptmax) {
			$transcriptmax = length($sequence) ;
			$transcriptname= $header . "\n" . $sequence ;
		}
		
		#Processing the new sequence formed
		
		$header = $_;
		$sequence = '';
		
	}
	
	else {
		$sequence .= $_;
	}
}

#For last sequence 


if (length($sequence) > $transcriptmax)  {
	
	$transcriptmax = length($sequence) ;
	$transcriptname = $header . "\n" . $sequence;
	$finalresult = $transcriptmax . $transcriptname;
	
	print "Debug: transcriptname: $header\n";
    print "Debug: finalresult: $finalresult\n";

    # Write to j.txt
    print DETAIL $finalresult . "\n";
	print OUTPUT $transcriptname ;
}

else {
    # Update $finalresult with the last sequence if it's the longest
    $finalresult = $transcriptmax . $transcriptname;

    # Print debug information
    print "Debug: transcriptname: $header\n";
    print "Debug: finalresult: $finalresult\n";

    # Write to j.txt
    print DETAIL $finalresult . "\n";
	print OUTPUT $transcriptname ;
}

close(DETAIL);
close(OUTPUT) ;
close(INPUT);




print " \n \n The length of the biggest transcript is $transcriptmax \n \n";
print "Debug: Appended to j.txt\n";
print "Debug: Content written: $finalresult\n";
print "my name is $finalresult " ;

