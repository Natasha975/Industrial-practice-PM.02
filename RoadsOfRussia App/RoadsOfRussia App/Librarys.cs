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
    
    public partial class Librarys
    {
        public int Id { get; set; }
        public int IdFile { get; set; }
        public Nullable<int> IdSection { get; set; }
    
        public virtual Files Files { get; set; }
        public virtual Sections Sections { get; set; }
    }
}
