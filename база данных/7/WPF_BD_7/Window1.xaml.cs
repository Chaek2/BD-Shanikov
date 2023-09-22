using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WPF_BD_7
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DB_Class.Users_ID = _LOG.Text;
            DB_Class.Password = _PAS.Password;
            DB_Class.ConnStr = string.Format(DB_Class.ConnStr, DB_Class.Users_ID, DB_Class.Password);
            DB_Class db_class = new DB_Class();
            try
            {
                db_class.conn.Open();
                Visibility = Visibility.Hidden;
                MainWindow main = new MainWindow();
                main.Show();
            }
            catch
            {
                MessageBox.Show("Не верный логин или пароль!", DB_Class.App_Name);
                _LOG.Focus();
            }
            finally
            {
                db_class.conn.Close();
                _LOG.Clear();
                _PAS.Clear();
            }

        }
    }
}
