using DBLabProject.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBLabProject
{
    public partial class Requests : System.Web.UI.Page
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
        //    string query = "SELECT ID, Name, Email,Age, Gender, Phone, Address, EntryDate,(SELECT BloodGroup FROM bloodgroup WHERE Id=BloodGroupId) AS BloodGroup FROM donors Order By ID DESC";
        //    DataTable dt = MySQLQuery.ReturnDataTable(query);
        //    donorGrid.DataSource = dt;
        //    donorGrid.DataBind();
        //    donorGrid.EmptyDataText = "No Data found!";
        }
        private void ClearControls()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtDate.Text = "";
            txtPhone.Text = "";
            txtDetails.Text = "";
            txtAge.Text = "";
            ddlBloodGroup.SelectedValue = "0";
        }
        private void LoadBloodGroup()
        {
            string query = "SELECT Id, BloodGroup FROM bloodgroup ORDER By BloodGroup ASC";
            MySQLQuery.PopulateDropDown(query, ddlBloodGroup, "Id", "BloodGroup");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string gender = "Male";
                if (rdFemale.Checked)
                {
                    gender = "Female";
                }
                    string query = "INSERT INTO `requestes`(`name`, `gender`, `age`, `mobile`, `email`, `bgroup`, `reqdate`, `detail`) VALUES ('" + txtName.Text + "','" + gender + "','" + txtAge.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + ddlBloodGroup.SelectedValue + "','"+txtDate.Text+"','" + txtDetails.Text + "')";
                    MySQLQuery.ExecNonQry(query);
                    MySQLQuery.ShowMessage("Request Submit successfully:", "success", msgLabel);
                    ClearControls();
                    BindDonorGridView();
            }
            catch (Exception ex)
            {
                MySQLQuery.ShowMessage("ERROR:" + ex.ToString(), "error", msgLabel);
            }
        }
    }
}