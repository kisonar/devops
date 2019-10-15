#!/usr/bin/perl

use strict;
use warnings;

use Log::Nxlog;
# Without Log::Nxlog you cannot access (read or modify) the event data

#use XML::Simple;

sub process
{
    # The event data is passed here when this method is invoked by the module
    my ( $event ) = @_;
    my $xmlSimple = new XML::Simple(KeepRoot   => 1);
    #my $dataXML = $xmlSimple->XMLin($event);
    #my $jsonString = encode_json($dataXML);
    Log::Nxlog::log_warning('Transformed file');

}