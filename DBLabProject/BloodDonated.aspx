<%@ Page Title="Blood Donated" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BloodDonated.aspx.cs" Inherits="DBLabProject.BloodDonated" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-8">

            <div class="form-horizontal">
                <div class="Card-header">
                    <strong>Blood Donated</strong>
                </div>
                <div class="Card-Body">
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Label ID="msgLabel" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Donation Date</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ClientIDMode="Static" ID="txtDate" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">No of Units</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtUnit" CssClass="form-control" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-3 control-label">Location</label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtLocation" CssClass="form-control" />
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
                            <asp:Button runat="server" Text="Save" CssClass="btn btn-primary" ID="btnSubmit" OnClick="btnSubmit_Click"/>
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
