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
    public partial class AddDonor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBloodGroup();
                BindDonorGridView();
            }
        }
        private void BindDonorGridView()
        {
            string query = "SELECT ID, Name, Email,Age, Gender, Phone, Address, EntryDate,(SELECT BloodGroup FROM bloodgroup WHERE Id=BloodGroupId) AS BloodGroup FROM donors Order By ID DESC";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            donorGrid.DataSource = dt;
            donorGrid.DataBind();
            donorGrid.EmptyDataText = "No Data found!";
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
        private void LoadBloodGroup()
        {
            string query = "SELECT Id, BloodGroup FROM bloodgroup ORDER By BloodGroup ASC";
            MySQLQuery.PopulateDropDown(query, ddlBloodGroup, "Id", "BloodGroup");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string gender = "Male";
                if (rdFemale.Checked)
                {
                    gender = "Female";
                }
                if (btnSave.Text == "Add Donor")
                {
                    string isExist = MySQLQuery.ReturnString("SELECT UserId From Donors WHERE UserId='" + txtUser.Text + "'");
                    if (isExist == "")
                    {
                        string query = "INSERT INTO donors (Name,Gender,Age,BloodGroupId, Email, Phone,Address,UserId) VALUES ('" + txtName.Text + "','" + gender + "','" + txtAge.Text + "','" + ddlBloodGroup.SelectedValue + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "','" + txtUser.Text + "')";
                        string sqlquery = "INSERT INTO user (UserName, Password, Name, Role) VALUES ('" + txtUser.Text + "','" + txtPassword.Text + "','" + txtName.Text + "','Donor')";
                        MySQLQuery.ExecNonQry(query);
                        MySQLQuery.ExecNonQry(sqlquery);
                        MySQLQuery.ShowMessage("Donor add successfully:", "success", msgLabel);
                        ClearControls();
                        LoginInfo.Visible = true;
                        BindDonorGridView();
                    }
                    else
                    {
                        MySQLQuery.ShowMessage("User Id already exist! try another user id", "warning", msgLabel);
                    }
                }
                else
                {
                    //string query = "INSERT INTO donors (Name,Gender,Age,BloodGroupId, Email, Phone,Address) VALUES ('" + txtName.Text + "','" + gender + "','" + txtAge.Text + "','" + ddlBloodGroup.SelectedValue + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "')";
                    string query = "UPDATE donors SET Name='" + txtName.Text + "',Gender='" + gender + "',Age='" + txtAge.Text + "',BloodGroupId='" + ddlBloodGroup.SelectedValue + "', Email='" + txtEmail.Text + "', Phone='" + txtPhone.Text + "',Address='" + txtAddress.Text + "' WHERE ID='" + Session["Id"] + "'";
                    MySQLQuery.ExecNonQry(query);
                    MySQLQuery.ShowMessage("Donor update successfully:", "success", msgLabel);
                    ClearControls();
                    btnSave.Text = "Save";
                    BindDonorGridView();
                }
            }
            catch (Exception ex)
            {
                MySQLQuery.ShowMessage("ERROR:" + ex.ToString(), "error", msgLabel);
            }
        }
        protected void donorGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(donorGrid.SelectedIndex);
            Label lblItemName = donorGrid.Rows[index].FindControl("Label1") as Label;
            EditMode(lblItemName.Text);
        }
        private void EditMode(string id)
        {

            string query = "SELECT `ID`, `Name`, `Email`, Age, Gender,`Phone`, `Address`,`EntryDate`, `BloodGroupId` FROM `donors` WHERE ID='" + id + "'";
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
                LoginInfo.Visible = false;
                ddlBloodGroup.SelectedValue = dt.Rows[0]["BloodGroupId"].ToString();
                txtAge.Text = dt.Rows[0]["Age"].ToString();
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                btnSave.Text = "Update";
                msgLabel.Text = "Edit Mode Activated!";
                msgLabel.Attributes.Add("class", "info");
                Session["Id"] = id;
            }
        }



        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                string query = "DELETE FROM donors WHERE(ID = '" + id + "')";
                MySQLQuery.ExecNonQry(query);
                BindDonorGridView();
                MySQLQuery.ShowMessage("Record Deleted ", "success", msgLabel);
            }
            catch (Exception ex)
            {
                MySQLQuery.ShowMessage("ERROR:" + ex.ToString(), "error", msgLabel);
            }



        }
    }
}