using System.Data;
using System.Data.SqlClient;


namespace WPF_BD_7
{
    class DB_Class
    {
        public static string ConnStr = " Data Source= ACER-AN\\SQLXARD;Initial Catalog=Restoran_DB; Persist Security Info = true; User ID = sa; Password = 123";
        //public static string ConnStr = "Data Source= DESKTOP-8IQR0EI\\SQLEXPRESS;Initial Catalog=Restoran_DB; Persist Security Info = true; User ID = {0}; Password = {1}";
        public static string Users_ID = "null", Password = "null", App_Name = "Администратор - Продажа товара";
        public SqlConnection conn = new SqlConnection(ConnStr);
        public SqlCommand command = new SqlCommand();
        public DataTable ResTable = new DataTable();
        public SqlDependency dep = new SqlDependency();
        public enum act { select, manipulation };
        public void SqlExecute(string querty, act act)
        {
            command.Connection = conn;
            command.CommandText = querty;
            command.Notification = null;
            switch (act)
            {
                case act.select:
                    dep.AddCommandDependency(command);
                    SqlDependency.Start(conn.ConnectionString);
                    conn.Open();
                    ResTable.Load(command.ExecuteReader());
                    conn.Close();
                    break;
                case act.manipulation:
                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();
                    break;
            }
        }





    }
}
