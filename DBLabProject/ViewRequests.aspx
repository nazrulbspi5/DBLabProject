<%@ Page Title="View Requests" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRequests.aspx.cs" Inherits="DBLabProject.ViewRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Blood Request List</strong>
                </div>
                <div class="Card-Body">
                    <asp:GridView ID="bloodRequestGrid" CssClass="table table-bordered" DataKeyNames="req_id" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="#SL">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                    <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Bind("req_id") %>'></asp:Label>
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
                            <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Till Required Date">
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("reqdate")).ToString("dd-MMM-yyyy") %>
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
