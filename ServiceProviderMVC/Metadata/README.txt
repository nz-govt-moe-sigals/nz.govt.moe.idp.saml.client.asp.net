This is where you place the IdentIdP's metadata file.

## Background Information:
In order to establish Mutual Trust between the SP and the IdP
there is a manual process of downloading the IdP's self-describing metadata file
and manually placing it within this application, in this folder.


## Source
The IdP's self-describing metadata file is obtained by:
* Starting the solution
* Navigating to the IdP's website's httphandler:
* https://localhost:6000/handlers/Metadata.ashx  
* The metadata file will immediately download.
* Get it, rename it (eg: to 'metadata-idp-demo.xml')
* Place it in this directory.
* Restart the app.

## Hint:
The metadata file should be named 'metadata-{IDPReference}.xml' because the folder
can have multiple IdP metadata files...

## How it Works
Note that the SAML Client works by using the Relative path within the web.config (that
gets it to the '/Metadata' folder.
