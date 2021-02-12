<%@ Page Title="View Donation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDonations.aspx.cs" Inherits="DBLabProject.ViewDonations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-12">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Blood Donation History</strong>
                </div>
                <div class="Card-Body">
                    <asp:GridView ID="donationGrid" CssClass="table table-bordered" DataKeyNames="donation_id" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="#SL">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                    <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Bind("donation_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("ddate")).ToString("dd-MMM-yyyy") %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Units" HeaderText="No of Units" SortExpression="Units">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                           
                            
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
