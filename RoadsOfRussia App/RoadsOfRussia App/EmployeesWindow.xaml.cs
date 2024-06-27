using iTextSharp.text.pdf;
using MessagingToolkit.QRCode.Codec;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
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
	/// Логика взаимодействия для EmployeesWindow.xaml
	/// </summary>
	public partial class EmployeesWindow : Window
	{
		public EmployeesWindow(int emplo)
		{
			InitializeComponent();
			string codeEmpl;
			try
			{
				/// <summary>
				/// Вывод информации о сотруднике на окно приложения
				/// </summary>
				using (var db = new RoadsOfRussiaEntities())
				{
					var empl = db.Employees.FirstOrDefault(em => em.id == emplo);

					tbLastname.Text = empl.Lastname;
					tbName.Text = empl.Name;
					tbSurname.Text = empl.Surname;
					int idRoleEmpl = empl.IdRole;
					var roles = db.Roles.FirstOrDefault(em => em.id == idRoleEmpl);
					tbRole.Text = roles.Name;
					tbPhone.Text = empl.Workphone;
					int idTerrEmpl = empl.IdTerritory;
					var devision = db.Territorys.FirstOrDefault(de => de.Id == idTerrEmpl);
					tbDevision.Text = devision.NameDivision;
					tbEmail.Text = empl.E_mail;
					data.Text = empl.Birthday.ToString();
					codeEmpl = $"Информация о сотруднике:\nФамилия - {empl.Lastname};\nИмя - {empl.Name};\n" +
						$"Отчество - {empl.Surname};\nДолжность - {roles.Name};\nТелефон - {empl.Workphone};\nОтдел - {devision.NameDivision};\n" +
						$"Почта - {empl.E_mail};\nДень рождение - {empl.Birthday.ToString()}";
				}
				/// <summary>
				/// Формирование QR-кода
				/// </summary>
				QRCodeEncoder qRCodeEncoder = new QRCodeEncoder();
				Bitmap qrcode = qRCodeEncoder.Encode(codeEmpl);
				MemoryStream ms = new MemoryStream();
				((Bitmap)qrcode).Save(ms, System.Drawing.Imaging.ImageFormat.Bmp);
				BitmapImage image = new BitmapImage();
				image.BeginInit();
				ms.Seek(0, SeekOrigin.Begin);
				image.StreamSource = ms;
				image.EndInit();
				imCode.Source = image;
			} catch(Exception e) { MessageBox.Show("Ошибка"+e.ToString());}
		}
		/// <summary>
		/// Сохранение QR-кода в PDF
		/// </summary>
		private void tbSave_Click(object sender, RoutedEventArgs e)
		{
			PngBitmapEncoder encoder = new PngBitmapEncoder();
			encoder.Frames.Add(BitmapFrame.Create((BitmapSource)imCode.Source));
			using (MemoryStream ms = new MemoryStream())
			{
				encoder.Save(ms);
				byte[] imageBytes = ms.ToArray();
				iTextSharp.text.Document doc = new iTextSharp.text.Document();
				string emailEmpl = tbEmail.Text;
				PdfWriter.GetInstance(doc, new FileStream($"pdfDoc{emailEmpl}.pdf", FileMode.Create));
				doc.Open();
				iTextSharp.text.Image pdfImage = iTextSharp.text.Image.GetInstance(imageBytes);
				doc.Add(pdfImage);
				doc.Close();
			}
			MessageBox.Show("PDF-документ сохранен");
		}
	}
}
