﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RoadsOfRussiaEntities : DbContext
    {
        public RoadsOfRussiaEntities()
            : base("name=RoadsOfRussiaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CategoryFiles> CategoryFiles { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<Events> Events { get; set; }
        public virtual DbSet<Files> Files { get; set; }
        public virtual DbSet<Librarys> Librarys { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Sections> Sections { get; set; }
        public virtual DbSet<StatusEvents> StatusEvents { get; set; }
        public virtual DbSet<StatusFiles> StatusFiles { get; set; }
        public virtual DbSet<StatusMaterials> StatusMaterials { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Territorys> Territorys { get; set; }
        public virtual DbSet<TypeEvents> TypeEvents { get; set; }
        public virtual DbSet<TypeMaterials> TypeMaterials { get; set; }
        public virtual DbSet<Сalendars> Сalendars { get; set; }
        public virtual DbSet<СardofMaterials> СardofMaterials { get; set; }
    }
}
