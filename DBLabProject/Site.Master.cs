using DBLabProject.Common;
using System;
using System.Web.UI;
namespace DBLabProject
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["UserName"] == null) && (Session["Password"] == null))
                {
                    //Response.Redirect("Login.aspx");
                    auth.Visible = false;
                    authLogin.Visible = true;
                }
                else
                {
                    auth.Visible = true;
                    authLogin.Visible = false;

                    lblUserName.Text = MySQLQuery.ReturnString("SELECT Name FROM user Where  UserName='" + Session["UserName"].ToString() + "'");
                }
                if (Session["Role"]==null)
                {
                    GetMenu("");
                    
                }
                else
                {
                    GetMenu(Session["Role"].ToString());
                }

               
            }
        }
        private void GetMenu(string role)
        {
            if (role=="Donor")
            {
                liProfile.Visible = true;
                liViewDonations.Visible = true;
                liViewRequests.Visible = true;
                liBloodDonated.Visible = true;
                liAddBloodGroup.Visible = false;
                liReg.Visible = false;
            }
            else if(role == "Admin")
            {
                liAddBloodGroup.Visible = true;
                liReg.Visible = false;
                liAddDonor.Visible = true;
            }
            else
            {
                liSearch.Visible = true;
                liRequests.Visible = true;
                liViewRequests.Visible = true;
                liProfile.Visible = false;
                liViewDonations.Visible = false;
               // liViewRequests.Visible = false;
                liBloodDonated.Visible = false;
                liAddBloodGroup.Visible = false;
                liReg.Visible = true;
            }
        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            if ((Session["UserName"] == null) && (Session["Password"] == null))
            {
                Response.Redirect("/");
            }
        }
    }
}