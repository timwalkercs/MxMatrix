using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using MxMatrix.Server.Models;
using System.Diagnostics;

namespace MxMatrix.Server.Data
{
    public class DbContextEF : DbContext
    {
        public DbContextEF(DbContextOptions<DbContextEF> options) : base(options) { }

        public DbSet<MxSwitch>? Switches { get; set; }
        public DbSet<Descriptor>? Descriptors { get; set; }
        public DbSet<SwitchDescriptor>? SwitchDescriptors { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)  //Add entity for our Switch model
        {
            //modelBuilder.HasDefaultSchema("SwitchSchema"); sets default schema to avoid using .ToTable(_, _) but our specific table doesn't match the model name   
            modelBuilder.Entity<MxSwitch>().ToTable("switches", "SwitchSchema");  //says to look for the ___ table in the ___ schema 

            modelBuilder.Entity<Descriptor>().ToTable("descriptors", "SwitchSchema");

            modelBuilder.Entity<SwitchDescriptor>()
                .HasKey(sd => new { sd.SwitchId, sd.DescriptorId });

            modelBuilder.Entity<SwitchDescriptor>().ToTable("switch_descriptor", "SwitchSchema");

            modelBuilder.Entity<SwitchDescriptor>()
                .HasOne(sd => sd.Switch)
                .WithMany(s => s.SwitchDescriptors)
                .HasForeignKey(sd => sd.SwitchId);

            modelBuilder.Entity<SwitchDescriptor>()
                .HasOne(sd => sd.Descriptor)
                .WithMany(d => d.SwitchDescriptors)
                .HasForeignKey(sd => sd.DescriptorId);

        }
    }
}
