using DBLabProject.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBLabProject
{
    public partial class DonorRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBloodGroup();
            }
        }
        
        private void ClearControls()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtAge.Text = "";
            ddlBloodGroup.SelectedValue = "0";
            txtUser.Text = "";
            txtPassword.Text = "";
        }
        private void LoadBloodGroup()
        {
            string query = "SELECT Id, BloodGroup FROM bloodgroup ORDER By BloodGroup ASC";
            MySQLQuery.PopulateDropDown(query, ddlBloodGroup, "Id", "BloodGroup");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string isExist = MySQLQuery.ReturnString("SELECT UserId From Donors WHERE UserId='" + txtUser.Text + "'");
                if (isExist=="")
                {
                    string gender = "Male";
                    if (rdFemale.Checked)
                    {
                        gender = "Female";
                    }
                    string query = "INSERT INTO donors (Name,Gender,Age,BloodGroupId, Email, Phone,Address,UserId) VALUES ('" + txtName.Text + "','" + gender + "','" + txtAge.Text + "','" + ddlBloodGroup.SelectedValue + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "','" + txtUser.Text + "')";
                    string sqlquery = "INSERT INTO user (UserName, Password, Name, Role) VALUES ('" + txtUser.Text + "','" + txtPassword.Text + "','" + txtName.Text + "','Donor')";
                    MySQLQuery.ExecNonQry(query);
                    MySQLQuery.ExecNonQry(sqlquery);
                    MySQLQuery.ShowMessage("Donor registration successfully:", "success", msgLabel);
                    ClearControls();

                }
                else
                {
                    MySQLQuery.ShowMessage("User Id already exist! try another user id", "warning", msgLabel);
                }
                
            }
            catch (Exception ex)
            {
                MySQLQuery.ShowMessage("ERROR:" + ex.ToString(), "error", msgLabel);
            }
        }

        
    }
}