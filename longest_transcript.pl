use strict;
use warnings;

# Open the file list containing .fa file names
open(IN, "file_list.txt") || die "Can't open file_list.txt: $!";

open(LENGTH_DETAILS, ">", "lengthdetails.txt") || die "Can't create lengthdetails.txt: $!";

while (<IN>) {
  chomp;  # Remove trailing newline

  # Extract input and output filenames
  my $input_file = $_;
  my $output_file = $input_file;
  $output_file =~ s/\.fa$/_longest.fa/;

  # Process the current input file
  process_file($input_file, $output_file);
}

close(LENGTH_DETAILS);
close(IN);

sub process_file {
  my $input_file = shift;
  my $output_file = shift;

  # Open input, output, and length details files
  open(INPUT, "<", $input_file) || die "Can't open input file $input_file: $!";
  open(OUTPUT, ">", $output_file) || die "Can't create output file $output_file: $!";

  # Initialize variables
  my $transcriptname = '';
  my $transcriptmax = 0;
  my $header = '';
  my $sequence = '';

  # Process each sequence and header
  while (<INPUT>) {
    chomp;
    if (/^>(\S+)\s.*$/) {
      if (length($sequence) > $transcriptmax) {
        $transcriptmax = length($sequence);
        $transcriptname = $header . "\n" . $sequence;
      }

      $header = $_;
      $sequence = '';
    } else {
      $sequence .= $_;
    }
  }

  # Handle the last sequence
  if (length($sequence) > $transcriptmax) {
    $transcriptmax = length($sequence);
    $transcriptname = $header . "\n" . $sequence;
  }

  # Write result to output file and details file
  print OUTPUT $transcriptname;
  print LENGTH_DETAILS "$input_file: $transcriptmax\n$transcriptname\n";

  # Close files
  close(INPUT);
  close(OUTPUT);
}
