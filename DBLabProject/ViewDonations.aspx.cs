using DBLabProject.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBLabProject
{
    public partial class ViewDonations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDonorGridView();
            }
        }
        private void BindDonorGridView()
        {
            string query = "SELECT `donation_id`, `ddate`, `units`,Location, `detail`, `userId` FROM `donation` WHERE UserID='"+Session["UserName"]+"'";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            donationGrid.DataSource = dt;
            donationGrid.DataBind();
            donationGrid.EmptyDataText = "No Data found!";
        }
    }
}