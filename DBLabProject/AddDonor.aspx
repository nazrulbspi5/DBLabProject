<%@ Page Title="Add Donor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDonor.aspx.cs" Inherits="DBLabProject.AddDonor" %>

<%--<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=15.1.4.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Donor Entry</strong>
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
                    <asp:Panel ID="LoginInfo" runat="server">
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
                    </asp:Panel>
                   


                    <div class="form-group">
                        <label class="col-md-3 control-label">Address</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" ID="txtAddress" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-10">
                            <asp:Button runat="server" Text="Add Donor" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Donor List</strong>
                </div>
                <div class="Card-Body">
                    <asp:GridView ID="donorGrid" CssClass="table table-bordered" DataKeyNames="Id" OnSelectedIndexChanged="donorGrid_SelectedIndexChanged" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="#SL">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                    <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" SortExpression="BloodGroup">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                           
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="Content/Images/btnedit.gif" Text="Select" />
                                    <asp:ImageButton ID="btnDelete" OnClientClick="return confirm('Pressing OK will delete this record. Do you want to continue?')" CommandArgument='<%# Eval("ID") %>' OnCommand="btnDelete_Command" runat="server" CausesValidation="False"  ImageUrl="Content/Images/btndelete.gif" Text="Delete" ToolTip="Delete" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="server">
   
</asp:Content>
