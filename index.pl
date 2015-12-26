#!d:/programs/Perl/bin/perl.exe

use CGI;
use Fcntl ':flock'; #import LOCK_* constants
$| = 1;
use strict;

do 'config.pl';
use vars qw($title $basedir $baseURL $BGCOLOR $UNCHECKED_IMG
            $CHECKED_IMG $DOMAIN $RETURN_URL $RETURN_TEXT $OWNER_EMAIL);

my $q = new CGI;
print $q->header('text/html'),
        $q->start_html( -title=>"$title",
                        -style=>{ -src=>"stylefile"},
                        -bgcolor=>"$BGCOLOR"),
        $q->h3("Frank's CGI Test Page");

print $q->start_form( -method=>"post", -target=>"index.cgi"),
        qq{\n<table bgcolor="#FFFFFF" cellpadding="4" cellspacing="2" border="2" width="200">};

print qq{\n<tr><td><a href=\"client.cgi\">client.cgi</a></td></tr>\n},
		qq{\n<tr><td><a href=\"list_env.cgi/cgi-bin/config.pl?pid=123&pname=frank lv=1111&&&age=26\">list_env.cgi</a></td></tr>\n},
		qq{\n<tr><td><a href=\"server.cgi\">server.cgi</a></td></tr>\n},
		qq{\n<tr><td><a href=\"httprefer.cgi\">httprefer.cgi</a></td></tr>\n},
		qq{\n<tr><td><a href=\"tmstest.cgi\">tmstest.cgi</a></td></tr>\n},
		qq{\n<tr><td><a href=\"form.cgi\">simple form</a></td></tr>\n},
		qq{\n<tr><td><a href=\"display.cgi/cgi-bin/config.pl\">display</a></td></tr>\n},
		qq{\n<tr><td><a href=\"env.cgi\">env</a></td></tr>\n},
		qq{\n<tr><td><a href=\"image.cgi/images/alcatellucent.jpg\">alcatel-lucent logo</a></td></tr>\n},
		qq{\n<tr><td><a href=\"redirect.cgi\">redirect</a></td></tr>\n},
		qq{\n<tr><td><a href=\"call_load_hss_config.cgi\">Call Load</a></td></tr>\n},
		qq{\n<tr><td><a href=\"fpc/ftp.cgi\">FPC Tool</a></td></tr>\n};

print qq{</table>\n},$q->end_form;

print qq{\n<br>\n<hr align="left">\n<br>\n};
print_copyright();
print $q->end_html;
exit 0;                                               
       
sub print_copyright {
        print qq{<center>Email: <a href="mailto:franklvht$DOMAIN">franklvht$DOMAIN</a></center>};
} 
