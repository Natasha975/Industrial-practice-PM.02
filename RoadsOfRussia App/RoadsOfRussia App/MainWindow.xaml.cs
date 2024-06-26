using System;
using System.Collections;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RoadsOfRussia_App
{
	/// <summary>
	/// Логика взаимодействия для MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}

		private void btVxod_Click(object sender, RoutedEventArgs e)
		{
			string log = tbLog.Text;
			string pass = tbPass.Text;
			using (var db = new RoadsOfRussiaEntities())
			{
				var empl = db.Employees.FirstOrDefault(em => em.Login == log && em.Password == pass);

				if (empl != null)
				{
					AllWindow allWindow = new AllWindow();
					allWindow.Show();
					this.Hide();
				}
				else
				{
					MessageBox.Show("Неверный логин или пароль!");
				}
			}
		}
	}
}