# nz.govt.moe.idp.saml.client.asp.net #

## Contents ##

This Solution contains the following Projects:

* The ServiceProvider (SP), which is an example of a Website containing unsecured pages, and secured pages.
* The nz.govt.moe.idp.saml.client library Referenced byt he SP, and uses SAML 2.0 to communicate with the IdP.
* The IdentityProvider (IdP) to which the SP delegates its Authentication to.
* There is also an older ASP.NET Classic ServiceProvider project -- but it's so old you probably will never need it.

### Service Provider

The Sevice Provider Website contains several pages:
* Background: providing some essential background on SAML that will be useful for understanding the protocol, which is needed for any debugging.
* Configuration: instructions on how to configure the device on which the SP is installed (ie, get HTTPS up and running), the SP (ie, configure the web.config, in order to generate the metadata file), establish mutual trust between the SP and IdP (ie, exchange metadata files)
* Unsecured: the default Index page, which when Configuration is complete, provides a link to an Secured Page.
* Secured: a secured page, which the SP's authentication framework (provided by the SAML client) should protect, and bounce the user out to the IdP in order to return with a valid token.

### The Identity Provider

Any access to a page on the SP goes through a stack of HttpHandlers, in an predefined order. 

The first Handler is the FormsAUthenticationHanlder. All it's doing is looking at the request for an ASP Session Token cookie, and if it finds one, uses it to create a thread IIdentity.

The second Handler is the UrlAUthenticationHandler, which looks at the url requested, determines if it needs securing, and if it does, looks for a thread identity. If there is no thread identity, or its expired, it 302's the request to the url defined in web config. In a simple POC, that page it redirects to is Login.aspx -- but when using this SAML client library, we're talking about SignonHandler.
The SignOnHandler prepares a SAMLREequest, and 302 POST's the request -- via the browser -- off to the IdP.

This IdP is just a dummy one -- DO NOT USE IN PRODUCTION! -- but it's enough to enter a username and password, in order for it to prepare a 302 POST response back -- via the browser -- to the signonHandler on the IdP.


## Preparation

Before you can run this solution you have to correctly configure it.

### Project Startup
Unlike many solutions, this solution requires two projects to be started at the same time (the SP and the IDP). 

Therefore:
* Unpack the Repository
* Right-click Properties on the Solution
* Select 'Multiple startup projects'
* Select both 'ServiceProviderMVC' and 'IdentityProvider'


### SSL Cert

The first time IIS starts the solution it's going to notice that the projects are configured to use IIS over IIS Epress.

And it will prompt you as to whether it is ok for IIS Express to install a self-signed cert.

Accept Yes (for now).
* Advantages:
  * Easy
* Disadvantages:
  * Doesn't teach you a thing about certs, which you will need to know about when you want to progress deployment past your dev machine, to ST, UAT and PROD servers.
  * Also, the Cert IIS Express generates is medium grade, will work in IE, but will raise the following issue in Chrome:
    * https://alexanderzeitler.com/articles/Fixing-Chrome-missing_subjectAltName-selfsigned-cert-openssl/
* Considerations:
  * Until you create your own higher quality LOCALHOST cert, chrome will warn you that they are unsafe sites, and you have to select 'Proceed to localhost (unsafe)'...


				