using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DBLabProject.Common
{
    public class MySQLQuery
    {
        static string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public static string ReturnString(string query)
        {
            string result = "";
            MySqlCommand cmd = new MySqlCommand(query, new MySqlConnection(conString));
            cmd.Connection.Open();
            result = Convert.ToString(cmd.ExecuteScalar());
            cmd.Connection.Close();
            return result;
        }
        public static int ExecNonQry(string query)
        {
            MySqlCommand cmd7 = new MySqlCommand(query, new MySqlConnection(conString));
            cmd7.Connection.Open();
            int numOfRowsAffected = cmd7.ExecuteNonQuery();
            cmd7.Connection.Close();
            cmd7.Connection.Dispose();
            return numOfRowsAffected;
        }

        public static DataTable ReturnDataTable(String Query)
        {
            MySqlCommand cmd2y = new MySqlCommand(Query, new MySqlConnection(conString));
            cmd2y.Connection.Open();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd2y);
            DataSet ds = new DataSet("Board");
            da.Fill(ds, "Board");
            cmd2y.Connection.Close();

            DataTable citydt = ds.Tables["Board"];
            return citydt;
        }
        public static void PopulateDropDown(string query, DropDownList ddGenerate, string value, string text)
        {
            MySqlCommand cmd = new MySqlCommand(query, new MySqlConnection(conString));
            cmd.Connection.Open();
            MySqlDataReader Grouplist = cmd.ExecuteReader();

            ddGenerate.DataSource = Grouplist;
            ddGenerate.DataValueField = value;
            ddGenerate.DataTextField = text;
            ddGenerate.DataBind();

            cmd.Connection.Close();
            cmd.Connection.Dispose();
        }

        public static void PopulateDropDownWithAll(string query, DropDownList ddGenerate, string value, string text)
        {
            ddGenerate.Items.Clear();
            ListItem lst = new ListItem("--- all ---", "0");
            ddGenerate.Items.Insert(ddGenerate.Items.Count, lst);
            MySqlCommand cmd = new MySqlCommand(query, new MySqlConnection(conString));
            cmd.Connection.Open();
            MySqlDataReader Grouplist = cmd.ExecuteReader();
            ddGenerate.DataSource = Grouplist;
            ddGenerate.DataValueField = value;
            ddGenerate.DataTextField = text;
            ddGenerate.DataBind();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
        }
        public static void ShowMessage(string msg, string type,Label lblMsg)
        {
            lblMsg.Text = msg;
            lblMsg.Attributes.Add("class", type);
            //return "<div class='xerp_" + type + "'>" + msg + "</div>";
        }
    }
}