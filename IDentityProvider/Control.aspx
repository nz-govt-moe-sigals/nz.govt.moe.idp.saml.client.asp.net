<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Control.aspx.cs" Inherits="IdentityProviderDemo.Control" MasterPageFile="~/idp.Master" %>

<%@ Import Namespace="IdentityProviderDemo.Logic" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {font-family:Arial;}
        .XYZ {font-family:Consolas;color:darkblue;}
    </style>
    <div>
        <h1>Identity Provider
        </h1>
        <p>
            This is the demo Identity Provider (IdP) that the Service Provider (SP) (ie, a website that's providing a Service to end users)
        delegates to when a User is not Authenticated, and is trying to access a secure page.
        </p>
        <p>
            This demo IdP is provided in order for you to see how the SP works. 
            <br />
            Important: it's a pretty rudimentary IdP -- so don't use it production.
        </p>
    </div>
    <div>
        <h2>Mutual Trust
        </h2>
        <p>
            The SAML protocol is based on establishing Mutual Trust between the Service Provider (ie, a website) 
            and the Identity Provider (IdP) which is doing the work of authenticating the user.
        </p>
        <p>
            The process of setting up mutual trust between two sites is accomplished by both sites
            swapping self-describing Metadata files.
        </p>
        <p>
            Generating and Registering this IdP's metadata file within the SP is only <i>one half</i> of establishing 'Mutual Trust'.
        </p>
        <p>
            The next step it to use the SP's metadata endpoint download the SP's metadata file, 
            and use the form at the bottom  of this page to register it within this IdP's store of SP metadata files
            using the form at the bottom of this page.

        </p>
    </div>

    <div>
        <h2>Configuration</h2>
        <p>
            Some configuration steps need to be undertaken before this IdP is ready to: 
        <ul>
            <li>generate its metadata, and</li>
            <li>be able to persist an SP's metadata</li>
        </ul>
        </p>
        <p>
            Specifically, we're talking about:
        <ul>
            <li>Installing a Public/Private Key (with CN=LOCALHOST)</li>
            <li>Using this PPKey to back this site's HTTPS</li>
            <li>Assigning this P/P Key to the App so that it can sign the Metadata (it's common to use the same PPKEY for both HTTPS and signage...)</li>
            <li>Assigning 'Modify' rights to the '/metadata' folder, where SP metadata files will be persisted by this app.</li>
        </ul>
        </p>
        <p>
            Remaining configuration steps still to be done before this IdP works are as follows:
            <p />
            <asp:BulletedList ID="ConfigList" runat="server"></asp:BulletedList>
        </p>
    </div>


    <asp:Panel ID="ReadyPanel" runat="server" Visible="false">
        <h2>Ready To Rumble</h2>
        <p>
            This Identity Provider appears ready to accept transactions. 
        </p>


        <p>
            <h3>Configure the SAML Cert</h3>
            This IdP needs to know what Cert it is to use to sign its Metadata. 
            If you have not already done so -- or want to change it, use the following:
            <p />
            <div>
                <asp:Label runat="server" ID="certLabel"  CssClass="XYZ"></asp:Label>
                <br />
                <asp:Button runat="server" ID="ClearCert" Text="Change certificate" OnClick="ClearCert_Click" />
            </div>
        </p>

        <p>
            <h3>Set the Base Url</h3>
            Ensure the SP's web.config is pointing at this website's HTTPS endpoint (not just it's HTTP endpoint) 
            then generate its SP, and upload it to this IdP using the form below.
            <br />
            This SP's config file (which determines how its metadata is built and where it redirects to) should
            be configured to point to this site's HTTPS endpoint:
            <p />
            <div>
                <asp:Label runat="server" ID="baseUrlLabel"  CssClass="XYZ"></asp:Label>
                <br />
                <asp:Button runat="server" ID="ChangeBaseUrl" Text="Change Base Url" OnClick="ChangeBaseUrl_Click" />
            </div>
        </p>
        <p>
            <h3>Check Again</h3>
            Everything has to match -- if you change *anything* (http to https, uppercase/lowercase, port number, slash at the end of the url or id...)
            you'll most probably have to regenerate the Metadata, and reimport it into this IdP. SAML is finicky.
        </p>
        <p>
            <h3>Retrieve this IdP's Endpoint
            </h3>
            Once this app has been properly configured, you start by retrieving this IdP's 
            self-describing metadatafile and saving it in the SP's '/metadata' folder.
            <p />
            <li><a href="Handlers/Metadata.ashx"   CssClass="XYZ">Download this IdP's Metadata file...</a></li>
        </p>


        <div>
            <h4>Register SPs</h4>
            <p />
            <%if (IDPConfig.ServiceProviderCount == 0)
                { %>
            It is currently not configured to talk to any service providers. Please add metadata for at least one service provider.
            <%}
                else
                { %>
                It is currently configured to accept requests from the following service providers
                <br />
            <asp:Panel ID="ServiceProviderList" runat="server"   CssClass="XYZ" />
            <%  } %>
            <p></p>
            <div>
                <h4>SP Metadata Upload Form</h4>

                <asp:FileUpload runat="server" ID="_fileupload" />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Upload metadata" OnClick="UploadButton_Click" /><br />
                <br />
                <asp:Label runat="server" ID="_statusLabel"  CssClass="XYZ"/>
            </div>
        </div>

        <div>
            <h2>Now what?</h2>
            If 
            <ul>
                <li>
                    you configured the right endpoint (https), and 
                </li>
                <li>
                    provided this IdP enough 
            rights to use a cert to generate a self-describing, and

                </li>
                <li>
                    generated this IdP's metadata, and
                </li>
                <li>
                    persisted it within the SP's metadata folder, and 
                </li>
                <li>
                    configured the SP to also run under https (since its on the same dev machine, you can use the same CN=LOCALHOST cert...), and
                </li>
                <li>
                    Generated the SP's metadata, 
                </li>
                <li>
                    And used this form to register the SP's metadata, 
                </li>
                <li>
                    ...then...
                </li>
                <li> 
                    You have established mutual trust between SP and IdP.
                </li>
                <li>
                    So you can go back to the SP, and try to access a Secured Page, 
                </li>
                <li> 
                    And it will bounce you (302 GET) to its SignOnOff.ashx handler,
                    which will prepare a SAML request, and bounce your browser (302 POST + payload)
                    off to this IdP...and when you've signed in, will prepare a SAMLReponse, and bounce your browser (302 POST + paylaod)
                    back to the SignOnOff.ashx handler (which will create a FormHandler cookie then bounce your browser (302 GET + cookie) back to your
                    original page (the secure Page)...the asp modules will conver the cookie into an identity...all done (you have an App Session Token).
                </li>
            </ul>
        </div>
    </asp:Panel>

</asp:Content>

