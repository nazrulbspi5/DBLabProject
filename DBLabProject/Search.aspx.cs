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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBloodGroup();
                BindDonor();
            }
        }
        private void BindDonor()
        {
            string sql = "";
            if (ddlBloodGroup.SelectedValue!="0")
            {
                sql = "WHERE BloodGroupId='" + ddlBloodGroup.SelectedValue + "'";
            }
            string query = "SELECT ID, Name, Email,Age, Gender, Phone, Address, EntryDate,(SELECT BloodGroup FROM bloodgroup WHERE Id=BloodGroupId) AS BloodGroup FROM donors "+sql+" Order By ID DESC";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
          
        }
        private void LoadBloodGroup()
        {
            string query = "SELECT Id, BloodGroup FROM bloodgroup ORDER By BloodGroup ASC";
            MySQLQuery.PopulateDropDown(query, ddlBloodGroup, "Id", "BloodGroup");
        }

        protected void ddlBloodGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDonor();
        }
    }
}