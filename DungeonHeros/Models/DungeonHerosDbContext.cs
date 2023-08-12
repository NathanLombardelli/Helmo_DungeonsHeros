using DungeonHeros.Models.Configuration;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace DungeonHeros.Models
{
    public class DungeonHerosDbContext : IdentityDbContext<User>
    {

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
           //  optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb; Database=Installation; Trusted_Connection=True;");
            optionsBuilder.UseSqlServer(@"Server=192.168.128.18; Database=in19b1170; user id=in19b1170; password=9976;");
            
        }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new HeroConfiguration());
            modelBuilder.ApplyConfiguration(new TeamConfiguration());
            modelBuilder.ApplyConfiguration(new MonsterConfiguration());
            modelBuilder.ApplyConfiguration(new DungeonConfiguration());
            modelBuilder.ApplyConfiguration(new DungeonMonstreConfiguration());
            modelBuilder.ApplyConfiguration(new HeroTeamConfiguration());
            modelBuilder.ApplyConfiguration(new RolesConfiguration());
            modelBuilder.ApplyConfiguration(new UserRolesConfiguration());

            modelBuilder.Entity<Hero>().Property(h => h.Image).HasDefaultValue("Placeholder_hero.jpg"); //valeur par default.
            //modelBuilder.Entity<Hero>().HasData(new Hero() { Race = (Race)1, Classe = (Classe)1, Endurance = 7, Force = 7, Id = 1, Image = "Ghost.png", Nom = "Ghost" }); //insert data.
            
            //transformation int=>enum.
            modelBuilder.Entity<Hero>().Property(h => h.Classe).HasConversion(v => v.ToString(), v=> (Classe)Enum.Parse(typeof(Classe), v)); 
            modelBuilder.Entity<Hero>().Property(h => h.Race).HasConversion(v => v.ToString(), v => (Race)Enum.Parse(typeof(Race), v));

            modelBuilder.Entity<DungeonMonstreRelation>().HasKey(dm => new { dm.DungeonsId, dm.MonstresNom });
            modelBuilder.Entity<HeroTeamRelation>().HasKey(ht => new { ht.HeroesId, ht.TeamsId });

            //Level du dj = force du monstre qui le compose.
            //modelBuilder.Entity<Dungeon>().Property(d => d.Level).HasComputedColumnSql("[LastName] + ', ' + [FirstName]");

            //soluce for "The entity type 'IdentityUserLogin<string>' requires a primary key to be defined" error
            base.OnModelCreating(modelBuilder);


        }

        public DbSet<Team> Teams { get; set; }

        public DbSet<Hero> Hero { get; set; }

        public DbSet<User> User { get; set; }

        public DbSet<Dungeon> Dungeon { get; set; }

        public DbSet<Monstre> Monster { get; set; }

        public DbSet<DungeonMonstreRelation> DungeonMonstre { get; set; }

        public DbSet<HeroTeamRelation> HeroTeam { get; set; }
    }
}
