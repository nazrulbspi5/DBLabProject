<%@ Page Title="Blood Group" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBloodGroup.aspx.cs" Inherits="DBLabProject.AddBloodGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-6">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Blood Group Entry</strong>
                </div>
                <div class="Card-Body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <asp:Label ID="msgLabel" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Blood Group</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtBloodGroup" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-10">
                            <asp:Button runat="server" Text="Save" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Blood Group List</strong>
                </div>
                <div class="Card-Body">
                    <asp:GridView ID="BloodGroupGrid" CssClass="table table-bordered" DataKeyNames="Id" OnSelectedIndexChanged="BloodGroupGrid_SelectedIndexChanged" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="#SL">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                    <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BloodGroup" HeaderText="BloodGroup" SortExpression="BloodGroup">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            
                            <asp:TemplateField HeaderText="Action">
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
