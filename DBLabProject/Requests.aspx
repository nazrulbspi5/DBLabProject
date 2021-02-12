<%@ Page Title="Requests" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="DBLabProject.Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-8">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Send Request For Blood</strong>
                </div>
                <div class="Card-Body">
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Label ID="msgLabel" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Name</label>
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
                        <label class="col-md-3 control-label">Till Required Date</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ClientIDMode="Static" ID="txtDate" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Details</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" ID="txtDetails" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-10">
                            <asp:Button runat="server" Text="Submit" CssClass="btn btn-primary" ID="btnSubmit" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="col-md-2">

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="server">
     <script type="text/javascript">
        $(function () {
            $("#txtDate").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
            }
            );
        });
     </script>
</asp:Content>
