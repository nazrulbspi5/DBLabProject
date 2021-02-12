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
    public partial class ViewRequests : System.Web.UI.Page
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
            string query = "SELECT `req_id`, `name`, `gender`, `age`, `mobile`, `email`, `reqdate`, `detail`,(SELECT BloodGroup FROM bloodgroup WHERE Id=bgroup) AS BloodGroup FROM requestes Order By req_id DESC";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            bloodRequestGrid.DataSource = dt;
            bloodRequestGrid.DataBind();
            bloodRequestGrid.EmptyDataText = "No Data found!";
        }
    }
}