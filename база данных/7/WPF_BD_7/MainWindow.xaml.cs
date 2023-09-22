using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows;

namespace WPF_BD_7
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DB_Class db = new DB_Class();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click_14(object sender, RoutedEventArgs e)
        {
            _G1.Visibility = Visibility.Visible;
            _G2.Visibility = Visibility.Hidden;
            _G3.Visibility = Visibility.Hidden;
            _G4.Visibility = Visibility.Hidden;
            gr2.IsEnabled = true;
            gr3.IsEnabled = true;
            gr4.IsEnabled = true;
            gr1.IsEnabled = false;
            PostavkaFill();

        }
        private void PostavkaFill()
        {
            if(_dg_supply != null)
            {
                Action action = () =>
                {
                    DB_Class db_cl = new DB_Class();
                    db_cl.SqlExecute("select [ID_Supply], [Adress_Supply] from [dbo].[Supply]", DB_Class.act.select);
                    db_cl.dep.OnChange += Dep_OnChange_postavka;
                    _dg_supply.ItemsSource = db_cl.ResTable.DefaultView;
                    _dg_supply.Columns[0].Visibility = Visibility.Hidden;
                    _dg_supply.Columns[1].Header = "Адрес";
                };
                Dispatcher.Invoke(action);
            }
        }
        private void Dep_OnChange_postavka(object sender, SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                PostavkaFill();
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            _G1.Visibility = Visibility.Hidden;
            _G2.Visibility = Visibility.Visible;
            _G3.Visibility = Visibility.Hidden;
            _G4.Visibility = Visibility.Hidden;
            gr1.IsEnabled = true;
            gr3.IsEnabled = true;
            gr4.IsEnabled = true;
            gr2.IsEnabled = false;
            MenuFill();
        }
        private void MenuFill()
        {
            if (_dg_menu != null)
            {
                Action action = () =>
                {
                    DB_Class db_cl = new DB_Class();
                    db_cl.SqlExecute("select [ID_Menu], [Value_Menu] from [dbo].[Menu]", DB_Class.act.select);
                    db_cl.dep.OnChange += Dep_OnChange_menu;
                    _dg_menu.ItemsSource = db_cl.ResTable.DefaultView;
                    _dg_menu.Columns[0].Visibility = Visibility.Hidden;
                    _dg_menu.Columns[1].Header = "Название блюд меню";
                };
                Dispatcher.Invoke(action);
            }
        }
        private void Dep_OnChange_menu(object sender, SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                MenuFill();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            _G1.Visibility = Visibility.Hidden;
            _G2.Visibility = Visibility.Hidden;
            _G3.Visibility = Visibility.Visible;
            _G4.Visibility = Visibility.Hidden;
            gr1.IsEnabled = true;
            gr2.IsEnabled = true;
            gr4.IsEnabled = true;
            gr3.IsEnabled = false;
            ComponentFill();
        }
        private void ComponentFill()
        {
            if (_dg_component != null)
            {                
                Action action = () =>
                {
                    DB_Class db_cl = new DB_Class();
                    db_cl.SqlExecute("select [ID_Component], [Structure_Component], [Volume_Component] from [dbo].[Component]", DB_Class.act.select);
                    db_cl.dep.OnChange += Dep_OnChange_component;
                    _dg_component.ItemsSource = db_cl.ResTable.DefaultView;
                    _dg_component.Columns[0].Visibility = Visibility.Hidden;
                    _dg_component.Columns[1].Header = "Название";
                    _dg_component.Columns[2].Header = "Количество";
                };
                Dispatcher.Invoke(action);
            }
        }
        private void Dep_OnChange_component(object sender, SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                ComponentFill();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            _G1.Visibility = Visibility.Hidden;
            _G2.Visibility = Visibility.Hidden;
            _G3.Visibility = Visibility.Hidden;
            _G4.Visibility = Visibility.Visible;
            gr1.IsEnabled = true;
            gr2.IsEnabled = true;
            gr3.IsEnabled = true;
            gr4.IsEnabled = false;
            Supplier_CompanyFill();
        }
        private void Supplier_CompanyFill()
        {
            if (_dg_supplier_Company != null)
            {
                Action action = () =>
                {
                    DB_Class db_cl = new DB_Class();
                    db_cl.SqlExecute("select [ID_Supplier_Company], [Full_Organization], [Short_Organization], [Legal_Address], [Physical_Address], [ITN], [OKPO], [BIC] from [dbo].[Supplier_Company]", DB_Class.act.select);
                    db_cl.dep.OnChange += Dep_OnChange_supplier_company;
                    _dg_supplier_Company.ItemsSource = db_cl.ResTable.DefaultView;
                    _dg_supplier_Company.Columns[0].Visibility = Visibility.Hidden;
                    _dg_supplier_Company.Columns[1].Header = "Полное название организации";
                    _dg_supplier_Company.Columns[2].Header = "Сокращённое название организации";
                    _dg_supplier_Company.Columns[3].Header = "Физический адрес";
                    _dg_supplier_Company.Columns[4].Header = "Юридический дрес";
                    _dg_supplier_Company.Columns[5].Header = "ИНН";
                    _dg_supplier_Company.Columns[6].Header = "ОКПО";
                    _dg_supplier_Company.Columns[7].Header = "БИК";
                };
                Dispatcher.Invoke(action);
            }
        }
        private void Dep_OnChange_supplier_company(object sender, SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                Supplier_CompanyFill();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            DB_Class db_cl = new DB_Class();
            db_cl.SqlExecute("insert into [dbo].[Supply] ([Adress_Supply]) values('"+_supply.Text+"')", DB_Class.act.manipulation);
            _supply.Clear();
        }
        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалит выбранную запись?", DB_Class.App_Name, MessageBoxButton.YesNo, MessageBoxImage.Question))
            {
                case MessageBoxResult.Yes:
                    if (_dg_supply.Items.Count != 0 & _dg_supply.SelectedItems.Count != 0)
                    {
                        DataRowView dataRowView = (DataRowView)_dg_supply.SelectedItems[0];
                        DB_Class db_class = new DB_Class();
                        db_class.SqlExecute("delete from [dbo].[Supply] where [ID_Supply] = " + dataRowView[0], DB_Class.act.manipulation);
                    }
                    break;
            }
        }
        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            if (_dg_supply.Items.Count != 0 & _dg_supply.SelectedItems.Count != 0)
            {
                DataRowView dataRowView = (DataRowView)_dg_supply.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                db_class.SqlExecute("update [dbo].[Supply] set " +
                    "[Adress_Supply]  = '"+_supply.Text+"'"+
                    "where [ID_Supply] = " + dataRowView[0], DB_Class.act.manipulation);
            }
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            DB_Class db_cl = new DB_Class();
            db_cl.SqlExecute("insert into [dbo].[Menu] ([Value_Menu]) values('" + _menu.Text + "')", DB_Class.act.manipulation);
            _menu.Clear();
        }
        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалит выбранную запись?", DB_Class.App_Name, MessageBoxButton.YesNo, MessageBoxImage.Question))
            {
                case MessageBoxResult.Yes:
                    if (_dg_menu.Items.Count != 0 & _dg_menu.SelectedItems.Count != 0)
                    {
                        DataRowView dataRowView = (DataRowView)_dg_menu.SelectedItems[0];
                        DB_Class db_class = new DB_Class();
                        db_class.SqlExecute("delete from [dbo].[Menu] where [ID_Menu] = " + dataRowView[0], DB_Class.act.manipulation);
                    }
                    break;
            }
        }
        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            if (_dg_menu.Items.Count != 0 & _dg_menu.SelectedItems.Count != 0)
            {
                DataRowView dataRowView = (DataRowView)_dg_menu.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                db_class.SqlExecute("update [dbo].[Menu] set " +
                    "[Value_Menu]  = '" + _menu.Text + "'" +
                    "where [ID_Menu] = " + dataRowView[0], DB_Class.act.manipulation);
            }
        }

        private void Button_Click_9(object sender, RoutedEventArgs e)
        {
            if (_int_component.Value > -1)
            {
                DB_Class db_cl = new DB_Class();
                db_cl.SqlExecute("insert into [dbo].[Component] ([Structure_Component], [Volume_Component]) values('" + _component.Text + "'," + _int_component.Value + ")", DB_Class.act.manipulation);
                _component.Clear();
            }
        }
        private void Button_Click_10(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалит выбранную запись?", DB_Class.App_Name, MessageBoxButton.YesNo, MessageBoxImage.Question))
            {
                case MessageBoxResult.Yes:
                    if (_dg_component.Items.Count != 0 & _dg_component.SelectedItems.Count != 0)
                    {
                        DataRowView dataRowView = (DataRowView)_dg_component.SelectedItems[0];
                        DB_Class db_class = new DB_Class();
                        db_class.SqlExecute("delete from [dbo].[Component] where [ID_Component] = " + dataRowView[0], DB_Class.act.manipulation);
                    }
                    break;
            }
        }
        private void Button_Click_11(object sender, RoutedEventArgs e)
        {

            if (_dg_component.Items.Count != 0 & _dg_component.SelectedItems.Count != 0 & _int_component.Value > -1)
            {
                try 
                { 
                DataRowView dataRowView = (DataRowView)_dg_component.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                db_class.SqlExecute("update [dbo].[Component] set " +
                    "[Structure_Component]  = '" + _component.Text + "'" +
                    ",[Volume_Component]  = '" + _int_component.Value + "'" +
                    " where [ID_Component] = " + dataRowView[0], DB_Class.act.manipulation);
                }
                catch
                {
                    MessageBox.Show("Неправильные значения");
                }
            }

        }

        private void Button_Click_12(object sender, RoutedEventArgs e)
        {
            DB_Class db_cl = new DB_Class();
            db_cl.SqlExecute("insert into [dbo].[Supplier_Company] ([Full_Organization], [Short_Organization], [Legal_Address], [Physical_Address], [ITN], [OKPO], [BIC]) " +
                "values('" + _sp_All.Text + "','" + _sp_Short.Text +
                "','" + _sp_Fis_.Text + "','" + _sp_Sec.Text +
                "','" + _sp_ITN.Text + "','" + _sp_OKPO.Text +
                "','" + _sp_BIC.Text + "')", DB_Class.act.manipulation);
            _sp_All.Clear();
            _sp_Sec.Clear();
            _sp_Short.Clear();
            _sp_Fis_.Clear();
            _sp_OKPO.Clear();
            _sp_ITN.Clear();
            _sp_BIC.Clear();
        }
        private void Button_Click_13(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалит выбранную запись?", DB_Class.App_Name, MessageBoxButton.YesNo, MessageBoxImage.Question))
            {
                case MessageBoxResult.Yes:
                    if (_dg_supplier_Company.Items.Count != 0 & _dg_supplier_Company.SelectedItems.Count != 0)
                    {
                        DataRowView dataRowView = (DataRowView)_dg_supplier_Company.SelectedItems[0];
                        DB_Class db_class = new DB_Class();
                        db_class.SqlExecute("delete from [dbo].[Supplier_Company] where [ID_Supplier_Company] = " + dataRowView[0], DB_Class.act.manipulation);
                    }
                    break;
            }
        }
        private void Button_Click_15(object sender, RoutedEventArgs e)
        {
            if (_dg_supplier_Company.Items.Count != 0 & _dg_supplier_Company.SelectedItems.Count != 0)
            {
                try
                {
                    DataRowView dataRowView = (DataRowView)_dg_supplier_Company.SelectedItems[0];
                    DB_Class db_class = new DB_Class();
                    db_class.SqlExecute("update [dbo].[Supplier_Company] set " +
                        "[Full_Organization] ='" + _sp_All.Text +
                        "', [Short_Organization] ='" + _sp_Short.Text +
                        "', [Legal_Address] ='" + _sp_Fis_.Text +
                        "', [Physical_Address] ='" + _sp_Sec.Text +
                        "', [ITN] ='" + _sp_ITN.Text +
                        "', [OKPO] ='" + _sp_OKPO.Text +
                        "', [BIC] ='" + _sp_BIC.Text + "'" +
                        "where [ID_Supplier_Company] = " + dataRowView[0], DB_Class.act.manipulation);
                }
                catch
                {
                    MessageBox.Show("Неправильные значения");
                }
            }
        }

        private void _bd_dg_supply(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {            
            if (_dg_supply.Items.Count != 0 & _dg_supply.SelectedItems.Count != 0)
            {
                DataRowView dataRowView = (DataRowView)_dg_supply.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                _supply.Text = dataRowView[1].ToString();
            }
        }

        private void _bd_dg_menu(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            
            if (_dg_menu.Items.Count != 0 & _dg_menu.SelectedItems.Count != 0)
            {
                DataRowView dataRowView = (DataRowView)_dg_menu.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                _menu.Text = dataRowView[1].ToString();
            }
        }

        private void _bd_dg_component(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {            
            if (_dg_component.Items.Count != 0 & _dg_component.SelectedItems.Count != 0)
            {
                DataRowView dataRowView = (DataRowView)_dg_component.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                _component.Text = dataRowView[1].ToString();                
                _int_component.Value = Convert.ToInt32(dataRowView[2].ToString());
            }
        }

        private void _bd_dg_suppliercpmpany(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {            
            if (_dg_supplier_Company.Items.Count != 0 & _dg_supplier_Company.SelectedItems.Count != 0)
            {
                DataRowView dataRowView = (DataRowView)_dg_supplier_Company.SelectedItems[0];
                DB_Class db_class = new DB_Class();
                _sp_All.Text = dataRowView[1].ToString();
                _sp_Short.Text = dataRowView[2].ToString();
                _sp_Fis_.Text = dataRowView[3].ToString();
                _sp_Sec.Text = dataRowView[4].ToString();
                _sp_ITN.Text = dataRowView[5].ToString();
                _sp_OKPO.Text = dataRowView[6].ToString();
                _sp_BIC.Text = dataRowView[7].ToString();
            }
        }
    }
}
