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

namespace RoadsOfRussia_App
{
	/// <summary>
	/// Логика взаимодействия для AllWindow.xaml
	/// </summary>
	public partial class AllWindow : Window
	{
		public AllWindow()
		{
			InitializeComponent();
		}
		public string terr = "";
		public string brush = "";
		public string devis = "";
		/// <summary>
		/// Выбор сотрудников, которые работают на данной территории
		/// </summary>
		private void tviTerrLevel0_Selected(object sender, RoutedEventArgs e)
		{
			e.Handled = true;
			var sel = e.Source as TreeViewItem;
			if (sel != null)
			{
				terr = sel.Header as String;
;               using (var db = new RoadsOfRussiaEntities())
				{
					var users = from em in db.Employees
								join ter in db.Territorys on em.IdTerritory equals ter.Id
								join rol in db.Roles on em.IdRole equals rol.id
								where ter.NameTerritory == terr
								select new
								{
									em.Lastname,
									em.Name,
									em.Surname,
									ter.NameTerritory,
									ter.NameBranch,
									ter.NameDivision,
									em.Office,
									em.E_mail
								};
					dgList.ItemsSource = users.ToList();
				}
			}
		}
		private void tviTerrLevel1_Selected(object sender, RoutedEventArgs e)
		{
			e.Handled = true;
			var sel = e.Source as TreeViewItem;
			if (sel != null)
			{
				brush = sel.Header as String;
				; using (var db = new RoadsOfRussiaEntities())
				{
					var users = from em in db.Employees
								join ter in db.Territorys on em.IdTerritory equals ter.Id
								join rol in db.Roles on em.IdRole equals rol.id
								where ter.NameTerritory == terr && ter.NameBranch == brush
								select new
								{
									em.Lastname,
									em.Name,
									em.Surname,
									ter.NameTerritory,
									ter.NameBranch,
									ter.NameDivision,
									em.Office,
									em.E_mail
								};
					dgList.ItemsSource = users.ToList();
				}
			}
		}
		private void tviTerrLevel2_Selected(object sender, RoutedEventArgs e)
		{
			e.Handled = true;
			var sel = e.Source as TreeViewItem;
			if (sel != null)
			{
				devis = sel.Header as String;
				; using (var db = new RoadsOfRussiaEntities())
				{
					var users = from em in db.Employees
								join ter in db.Territorys on em.IdTerritory equals ter.Id
								join rol in db.Roles on em.IdRole equals rol.id
								where ter.NameTerritory == terr && ter.NameBranch == brush && ter.NameDivision == devis
								select new
								{
									em.Lastname,
									em.Name,
									em.Surname,
									ter.NameTerritory,
									ter.NameBranch,
									ter.NameDivision,
									em.Office,
									em.E_mail
								};
					dgList.ItemsSource = users.ToList();
				}
			}
		}
		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			AllEmp();
			try
			{
				using (var db = new RoadsOfRussiaEntities())
				{
					var newsNames = db.News.Select(n => n.Name).ToList();
					lvNews.ItemsSource = newsNames;
				}
			}
			catch (Exception ex) { MessageBox.Show("Ошибка"+ex.ToString()); }
		}
		public void AllEmp()
		{
			using (var db = new RoadsOfRussiaEntities())
			{
				var users = from em in db.Employees
							join ter in db.Territorys on em.IdTerritory equals ter.Id
							join rol in db.Roles on em.IdRole equals rol.id
							select new
							{
								em.Lastname,
								em.Name,
								em.Surname,
								ter.NameTerritory,
								ter.NameBranch,
								ter.NameDivision,
								em.Office,
								em.E_mail
							};
				dgList.ItemsSource = users.ToList();
			}
		}
		private void btAllEmployees_Click(object sender, RoutedEventArgs e)
		{
			AllEmp();
		}
		/// <summary>
		/// Реализация поиска по ФИО, названию отдела и почте
		/// </summary>
		private void tbPoisk_TextChanged(object sender, TextChangedEventArgs e)
		{
			string textPoisk = tbPoisk.Text;
			using (var db = new RoadsOfRussiaEntities())
			{
				var users = from em in db.Employees
							join ter in db.Territorys on em.IdTerritory equals ter.Id
							join rol in db.Roles on em.IdRole equals rol.id
							where em.Lastname.Contains(textPoisk) || em.Name.Contains(textPoisk) || 
								  em.Surname.Contains(textPoisk) || ter.NameDivision.Contains(textPoisk) ||
								  em.E_mail.Contains(textPoisk)
							select new
							{
								em.Lastname,
								em.Name,
								em.Surname,
								ter.NameTerritory,
								ter.NameBranch,
								ter.NameDivision,
								em.Office,
								em.E_mail
							};
				dgList.ItemsSource = users.ToList();
			}
		}
		/// <summary>
		/// Выбор сотрудника для отображения дополнительной информации о нем
		/// </summary>
		private void dgList_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (dgList.SelectedItem != null)
			{
				int selectedEmployee = dgList.SelectedIndex+1;

				EmployeesWindow emplWindow = new EmployeesWindow(selectedEmployee);
				emplWindow.ShowDialog();
			}
			else MessageBox.Show("Выберите сотрудника");
		}
	}
}