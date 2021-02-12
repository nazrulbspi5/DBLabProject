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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["UserName"] == null) && (Session["Password"] == null))
                {
                    
                }
                else
                {
                    EditMode(Session["UserName"].ToString());
                }
            }
            //LoadBloodGroup();
        }
        private void LoadBloodGroup()
        {
            string query = "SELECT Id, BloodGroup FROM bloodgroup ORDER By BloodGroup ASC";
            MySQLQuery.PopulateDropDown(query, ddlBloodGroup, "Id", "BloodGroup");
        }
        private void EditMode(string id)
        {
            string query = "SELECT `ID`, `Name`, `Email`, Age, Gender,`Phone`, `Address`,`EntryDate`, `BloodGroupId` FROM `donors` WHERE UserId='" + id + "'";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            if (dt.Rows.Count > 0)
            {
                txtName.Text = dt.Rows[0]["Name"].ToString();
                LoadBloodGroup();
                if (dt.Rows[0]["Gender"].ToString() == "Male")
                {
                    rdMail.Checked = true;
                    rdFemale.Checked = false;
                }
                else
                {
                    rdMail.Checked = false;
                    rdFemale.Checked = true;
                }
               
                ddlBloodGroup.SelectedValue = dt.Rows[0]["BloodGroupId"].ToString();
                txtAge.Text = dt.Rows[0]["Age"].ToString();
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                Session["Id"] = dt.Rows[0]["ID"].ToString();
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
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string gender = "Male";
            if (rdFemale.Checked)
            {
                gender = "Female";
            }
            string query = "UPDATE donors SET Name='" + txtName.Text + "',Gender='" + gender + "',Age='" + txtAge.Text + "',BloodGroupId='" + ddlBloodGroup.SelectedValue + "', Email='" + txtEmail.Text + "', Phone='" + txtPhone.Text + "',Address='" + txtAddress.Text + "' WHERE ID='" + Session["Id"] + "'";
            MySQLQuery.ExecNonQry(query);
            MySQLQuery.ShowMessage("Profile update successfully:", "success", msgLabel);
            //ClearControls();
            //btnSave.Text = "Save";
            //BindDonorGridView();
        }
    }
}