<%@ Page Title="Search Donor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="DBLabProject.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Search Donor</strong>
                </div>
                <div class="Card-Body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <asp:Label ID="msgLabel" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Blood Group</label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="ddlBloodGroup" DataValueField="Name" OnSelectedIndexChanged="ddlBloodGroup_SelectedIndexChanged" AutoPostBack="true" DataTextField="Name" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">---ALL---</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ddlBloodGroup" InitialValue="0"
                                CssClass="text-danger" ErrorMessage="Select Member." />
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Donor List</strong>
                </div>
                <div class="Card-Body">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4">
                                <div class="genealogy" style="border: 1px solid #4f5b69; overflow:hidden; box-shadow: 0px 0px 5px 2px #888888; min-height: 180px; margin-bottom: 20px; padding: 15px; font-size: 16px; text-align: center; line-height: 15px">
                                    <asp:Label ID="lblName" runat="server" Style="color: red; font-size: 22px;" Text='<%#Eval("Name")%>' /><br />
                                    <br />
                                    <label>Age: </label>
                                    <asp:Label Style="font-size: 14px;" runat="server" ID="lblAge" Text='<%#Eval("Age") %>' /><br />
                                    <br />
                                    <label>Gender:</label>
                                    <asp:Label Style="font-size: 14px;" ID="lblRank" runat="server" Text='<%#Eval("Gender")%>' /><br />
                                    <br />
                                    <label>Blood Group:</label>
                                    <asp:Label Style="font-size: 14px;" runat="server" ID="lbldate" Text='<%# Eval("BloodGroup") %>'></asp:Label><br />
                                    <br />
                                    <label>Mobile No:</label>
                                    <asp:Label Style="font-size: 14px;" runat="server" ID="lblQty" Text='<%#Eval("Phone") %>'></asp:Label><br />

                                    <br />
                                    <hr />
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
