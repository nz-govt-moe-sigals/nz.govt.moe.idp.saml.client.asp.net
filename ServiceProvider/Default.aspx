<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/sp.Master" Inherits="WebsiteDemo._Default" Title="Demo Service Provider" %>
<%@ Import namespace="nz.govt.moe.idp.saml.client.config"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Unsercured Page</h1>

    <h2>Overview</h2>
    This site is just a demo, and as such, does not have much in it. 
    <br />
    It consists of 
    <ul>
      <li>pages (one unsecured, and one secured page), </li> 
      <li>a couple of *.ashx pages that are registered in the web.config, to wrap handlers defined in the saml client library </li> 
       <li>2 sections in the webconfig to configure the client library (one to describe itself (the SP), and one describing info about the IdP)</li>
    </ul>

    The secured page is secured because 
    <code>
          <location path="SecuredPage.aspx">
    <system.web>
      <authorization>
        <deny users="?"/>
      </authorization>
    </system.web>
  </location>

    </code>


    <h2>Preparation</h2>
    <div>
        <h3>Certs</h3>
    </div>
    <div>
        <h3>SSL</h3>
    </div>
    <div>
        <h3>Web Config Configuration</h3>
    </div>
    <div>
        <h3>Metadata Generation</h3>
    </div>
    <div>
        <h3>Metadata Exchange</h3>
    </div>

    <div style="margin-top: 1em; ">
        <p style="width: 50em;">
        The IDentity Provider (IdP) and the service provider (SP) must exchange metadata in order to establish SAML connections.
        <% if (string.IsNullOrEmpty(SAML20FederationConfig.GetConfig().Endpoints.MetadataLocation)) { %>
            You must add the <b>&lt;IDPEndPoints&gt;</b> tag to the <b>"<%= ConfigurationConstants.SectionNames.SAML20Federation %>"</b> section of the
            application's configuration file in order to continue.
        <% } else if (certificateMissing) { %>
            <div style="color: Red;">
            The specified certificate could not be found. Please correct
            the certificate information in the "<%= ConfigurationConstants.SectionNames.Federation %>" section of the configuration file.
            </div>
        <% } else { %>
            The Identity provider's metadata should be put in the directory <b>"<%= SAML20FederationConfig.GetConfig().Endpoints.MetadataLocation %>"</b>.<br/><br/>
            The metadata of the service provider can be downloaded <a href="metadata.ashx">here</a>.
        <% } %>

        </p>
    </div>

    <div>
        <h3>
            Navigation
        </h3>
        <div>
            When you have established Mutual Trust between the IdP and SP, by each party generating a metadata describing itself,
            and each party saving the other's metadata (see above), you might be ready to navigate to a secured page, which should
            bounce you out of this Service Provider (SP)s website, off to a remote IdP (look at the urls in your browser).
        </div>
        <a href="Secured.aspx">Attempt to navigate to a <i>Secured</i> Page.</a>
    </div>


</asp:Content>
