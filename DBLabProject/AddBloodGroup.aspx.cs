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
    public partial class AddBloodGroup : System.Web.UI.Page
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
            string query = "SELECT ID, BloodGroup FROM BloodGroup ORDER BY BloodGroup ASC";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            BloodGroupGrid.DataSource = dt;
            BloodGroupGrid.DataBind();
            BloodGroupGrid.EmptyDataText = "No Data found!";
        }
        private void ClearControls()
        {
            txtBloodGroup.Text = "";
        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
               
                if (btnSave.Text == "Save")
                {
                   
                        string query = "INSERT INTO BloodGroup (BloodGroup) VALUES ('" + txtBloodGroup.Text + "')";
                        MySQLQuery.ExecNonQry(query);
                        MySQLQuery.ShowMessage("Blood Group add successfully:", "success", msgLabel);
                        ClearControls();
                        BindDonorGridView();
                   
                }
                else
                {
                    string query = "UPDATE BloodGroup SET BloodGroup='" + txtBloodGroup.Text + "' WHERE ID='" + Session["Id"] + "'";
                    MySQLQuery.ExecNonQry(query);
                    MySQLQuery.ShowMessage("Blood Group update successfully:", "success", msgLabel);
                    ClearControls();
                    BindDonorGridView();
                    btnSave.Text = "Save";
                }
            }
            catch (Exception ex)
            {
                MySQLQuery.ShowMessage("ERROR:" + ex.ToString(), "error", msgLabel);
            }
        }
        protected void BloodGroupGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(BloodGroupGrid.SelectedIndex);
            Label lblItemName = BloodGroupGrid.Rows[index].FindControl("Label1") as Label;
            EditMode(lblItemName.Text);
        }
        private void EditMode(string id)
        {
            string query = "SELECT `ID`, `BloodGroup` FROM `BloodGroup` WHERE ID='" + id + "'";
            DataTable dt = MySQLQuery.ReturnDataTable(query);
            if (dt.Rows.Count > 0)
            {
                txtBloodGroup.Text = dt.Rows[0]["BloodGroup"].ToString();
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
                string query = "DELETE FROM BloodGroup WHERE(ID = '" + id + "')";
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