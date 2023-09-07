# Check if this is being run with elevated privilege
$elevated = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (!$elevated) {
    Write-Output "Re-run this as a Domain User (CYBERSOLVE\vagrant or CYBERSOLVE\Administrator)"
}

Write-Output "A small window will pop up asking for the Certificate Authority to use. Just click OK to continue."

certreq -submit c:\vagrant\wildcard.cybersolve.lab.req c:\vagrant\wildcard.cybersolve.lab.crt

Import-Certificate c:\vagrant\wildcard.cybersolve.lab.crt -CertStoreLocation Cert:\LocalMachine\My\