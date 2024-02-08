Longest Transcript of FASTA sequences using Perl program

1. This is for Windows operating system . Perl compiler should be installed in your system . 'Strawberry Perl' is a distribution of the Perl programming language for the Microsoft Windows platform. Additionally, strawberry contains a fully featured Mingw-w64 C/C++ compiler with many libraries included. 

Download link - https://strawberryperl.com/

2. As of April 2013, Strawberry Perl consists of:

A Perl distribution
A Mingw-w64 distribution, consisting of gcc, ld, gmake and other binutils.
Windows installation scripts to allow Strawberry Perl to be easily uninstalled.
Various non-standard but widely used Perl modules. These mostly relate to ease of installation of further extensions from the CPAN, but also include various tools that enhance the ability to install packages from other sources such as the Perl Archive Toolkit, the Perl package manager and the Perl Installation Program.

3. For your FASTA format (.fa) files having multiple transcripts, you can use 'longest_transcript_main.pl'. Alongside the output file, a 'details.docx' file will be generated which will have the length of the sequence alongside the longest sequence.

4. For a list of FASTA files , you can use 'longest_transcript.pl'.

   a.) To intitalise it in Windows, Use the 'dir' command with appropriate options to locate and list all .fa files within your chosen directory and its subfolders-
    
  Eg: - dir "C:\Users\amit9\Desktop\CODE\CIRCADIAN GENES"\*.fa /s /b > file_list.txt
  (Replace C:\Users\amit9\Desktop\CODE\CIRCADIAN GENES with the actual path to your directory.)

   b.) Run 'longest_transcript.pl'in your command line
