<%@ Page Language="C#" Title="Login - BBMS" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DBLabProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <section id="loginForm">
                    <div class="form-horizontal">

                        <hr />
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                           <div class="col-md-offset-3 col-md-9">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                               </div>
                        </asp:PlaceHolder>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-3 control-label">User Name</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                    CssClass="text-danger" ErrorMessage="The User Name field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 control-label">Password</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <%--<div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>--%>
                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" CssClass="btn btn-block btn-primary" />
                            </div>
                        </div>
                    </div>

                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>
            </div>

            <div class="col-md-4">
            </div>
        </div>
    </form>
</body>
</html>
