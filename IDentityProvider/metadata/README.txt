This is the folder where uploaded SP metadata files are persisted by this app.

Whereas an SP usually only stores one metadata -- that of it's IdP -- an IdP often
is used to provide services to multiple SPs, and hence has multiple SP metadata 
files uploaded and persisted...

Configuration:
Note that because the App must persist files to it, the Folder must be configured to allow
'Modify' permissions to the Windows Account under which the IdP is running.