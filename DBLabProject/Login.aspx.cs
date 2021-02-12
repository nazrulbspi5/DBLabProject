using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBLabProject.Common;
namespace DBLabProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = "SELECT UserName,Password,Role FROM user Where  UserName='" + UserName.Text + "' AND Password='" + Password.Text + "'";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    Session["UserName"] = item["UserName"];
                    Session["Password"] = item["Password"];
                    Session["Role"] = item["Role"];
                    if ((Session["UserName"] != null) && (Session["Password"] != null))
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
            else
            {
                FailureText.Text = "UserName or Password Invalid!";
                ErrorMessage.Visible = true;
            }

        }
    }
}