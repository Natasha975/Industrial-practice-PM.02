//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RoadsOfRussia_App
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employees
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employees()
        {
            this.Events = new HashSet<Events>();
            this.Сalendars = new HashSet<Сalendars>();
            this.СardofMaterials = new HashSet<СardofMaterials>();
        }
    
        public int id { get; set; }
        public string Lastname { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int IdRole { get; set; }
        public string Workphone { get; set; }
        public string Office { get; set; }
        public byte[] Photo { get; set; }
        public int IdTerritory { get; set; }
        public string Manager { get; set; }
        public string Assistant { get; set; }
        public string Telephone { get; set; }
        public string E_mail { get; set; }
        public string Other { get; set; }
        public System.DateTime Birthday { get; set; }
        public Nullable<bool> NewsSubscription { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    
        public virtual Roles Roles { get; set; }
        public virtual Territorys Territorys { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Events> Events { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Сalendars> Сalendars { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<СardofMaterials> СardofMaterials { get; set; }
    }
}
