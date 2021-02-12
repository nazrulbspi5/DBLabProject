using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using DBLabProject.Common;
using MySql.Data.MySqlClient;

namespace DBLabProject
{
    public partial class _Default : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                if (Session["Role"] == null)
                {
                    lblWelcome.Text = "Welcome to Blood Bank Management System";
                }
                else if (Session["Role"].ToString()=="Donor")
                {
                    lblWelcome.Text = "Welcome to Donor Panel";
                }
                else
                {
                    lblWelcome.Text = "Welcome to Admin Panel";
                }

                
                //DataTable dt= MySQLQuery.ReturnDataTable("SELECT * FROM courses"); 
            }
        }
        
    }
}