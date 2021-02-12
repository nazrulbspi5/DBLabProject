<%@ Page Title="Donor Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonorRegistration.aspx.cs" Inherits="DBLabProject.DonorRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Donor Registration</strong>
                </div>
                <div class="Card-Body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <asp:Label ID="msgLabel" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Donor Name</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Gender</label>
                        <div class="col-md-9">

                            <asp:RadioButton ID="rdMail" GroupName="Gender" Checked="true" runat="server" Text="Male" />
                            <asp:RadioButton ID="rdFemale" GroupName="Gender" runat="server" Text="Female" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Age</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtAge" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Mobile No</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Blood Group</label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlBloodGroup" DataValueField="Name" DataTextField="Name" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">---Select---</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ddlBloodGroup" InitialValue="0"
                                CssClass="text-danger" ErrorMessage="Select Member." />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Email</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">User ID</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Address</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" ID="txtAddress" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-10">
                            <asp:Button runat="server" Text="Register" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
