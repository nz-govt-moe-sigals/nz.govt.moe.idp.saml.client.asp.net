<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="SignonForm.aspx.cs" MasterPageFile="~/idp.Master" Inherits="IdentityProviderDemo.SignonForm" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        It's no big secret (this is just a demo/dummy IdP to test the SP...) 

        The UserName and Password are defined in the web.config.

        (Case Sensitive!) Credentials you can use are:
        <ul>
            <li>JSmith - Test1234</li>
            <li>BSmith - Test1234</li>
        </ul>
    </div>

    <asp:Label runat="server" ID="ErrorLabel" Visible="false" ForeColor="Red"></asp:Label>
    <div>
        <span>Username : </span><asp:TextBox ID="UsernameTextbox" runat="server"  />
    </div>
    <div>
        <span>Password : </span><asp:TextBox ID="PasswordTestbox" TextMode="Password" runat="server"  />
    </div>
    <div>
        <asp:Button runat="server" Text="Login" OnClick="AuthenticateUser" />
    </div>
    <div>
        <asp:Label runat="server" ID="MessageLbl" />
    </div>
</asp:Content>