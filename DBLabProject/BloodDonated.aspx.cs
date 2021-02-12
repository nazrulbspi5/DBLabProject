using DBLabProject.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBLabProject
{
    public partial class BloodDonated : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ClearControls()
        {
            txtUnit.Text = "";
            txtDate.Text = "";
            txtDetails.Text = "";
            txtLocation.Text = "";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO `donation`(`ddate`,Location, `units`, `detail`, `userId`) VALUES ('" + txtDate.Text + "','"+txtLocation.Text+"','" + txtUnit.Text + "','" + txtDetails.Text + "','" + Session["UserName"] + "')";
                MySQLQuery.ExecNonQry(query);
                MySQLQuery.ShowMessage("Save successfully:", "success", msgLabel);
                ClearControls();
            }
            catch (Exception ex)
            {
                MySQLQuery.ShowMessage("ERROR:" + ex.ToString(), "error", msgLabel);
            }
        }
    }
}