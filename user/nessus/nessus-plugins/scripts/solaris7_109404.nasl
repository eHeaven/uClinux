#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(13163);
 script_version ("$Revision: 1.3 $");
 name["english"] = "Solaris 7 (sparc) : 109404-01";
 
 script_name(english:name["english"]);
 
 desc["english"] = "
The remote host is missing Sun Security Patch number 109404-01
( /usr/vmsys/bin/chkperm patch).

You should install this patch for your system to be up-to-date.

Solution : http://sunsolve.sun.com/search/document.do?assetkey=1-21-109404-01-1
Risk factor : High";


 script_description(english:desc["english"]);
 
 summary["english"] = "Check for patch 109404-01"; 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e =  solaris_check_patch(release:"5.7", arch:"sparc", patch:"109404-01", obsoleted_by:"", package:"SUNWfac");

if ( e < 0 ) security_hole(0);
