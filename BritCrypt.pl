#!/usr/bin/perl
# you will need: http://search.cpan.org/CPAN/authors/id/A/AY/AYRNIEU/Crypt-Rot13-0.6.tar.gz
# Note: May require manual installation. CPAN fails on it for some reason
# ~skyhighatrist (2015)
use strict;
use warnings;
use Crypt::Rot13;
use Term::ANSIColor;
# defining the colours here as variables to use later :)
my $green = color('bold bright_green');
my $blue = color('bold bright_blue'); 
my $cyan = color('bold bright_cyan');
my $red = color('bold bright_red');
my $magenta = color('bold bright_magenta');
my $reset = color('reset');

# yeah, functioney
sub BritCrypt {
    my ($infile, $outfile) = @_; # we just take the first two args.
    print $cyan."[*] ".$green."Reading $infile... Do tell us all your secrets!$reset\n";
    my $supersecureencryptionalgorithm = new Crypt::Rot13;
    open(THERESA_MAY, $infile) or die "$!";
    print $magenta."[+] ".$blue."Preparing the encryption...$reset\n";
    $supersecureencryptionalgorithm->charge(<THERESA_MAY>);
    print $magenta."[+] ".$blue."Encryption charged with plaintext...$reset\n";
    close(THERESA_MAY) or die "$!";
    open(DAVID_CAMERON, '>', $outfile) or die "$!";
    print $magenta."[+] ".$blue."Saving your secrets...$reset\n";
    print DAVID_CAMERON $supersecureencryptionalgorithm->rot13(-13);
    close(DAVID_CAMERON) or die "$!";
    print $cyan."[*] ".$green."Saved ciphertext to $outfile, do make sure to forward a copy to GCHQ!$reset\n";
}

if ($#ARGV + 1 != 2){ # count yer args before.
    print $red."BritCrypt - Completely Reversible, Theresa May Friendly Message Encryption Legal for Use in the UK\nUse: BritCrypt.pl input_plaintext.txt output_ciphertext.txt$reset\n";
    exit;
}
BritCrypt($ARGV[0], $ARGV[1]); # call our function with our args
#_EOF
