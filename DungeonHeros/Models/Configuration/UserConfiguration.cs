using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Security.Claims;

namespace DungeonHeros.Models.Configuration
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        
        public void Configure(EntityTypeBuilder<User> builder)
        {

            builder.ToTable("AspNetUsers");

            builder.HasData(

                //  new User { Id = "1", Email = "admin", NomHero = "admin",UserName = "admin", PasswordHash = "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==" },
                  new User { Id = "2", Email = "ghostkiller598r@gmail.com", NormalizedEmail="GHOSTKILLER598R@GMAIL.COM", NomHero = "Ghostkiller", UserName = "Ghostkiller", NormalizedUserName="GHOSTKILLER", PasswordHash = "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", DateOfBirth = new DateTime(2000, 06, 01) },
                  new User { Id = "3", Email = "nathanlombardelli@hotmail.com", NormalizedEmail = "NATHANLOMBARDELLI@HOTMAIL.COM", NomHero = "Ghost", UserName = "Ghost", NormalizedUserName = "GHOST", PasswordHash = "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", DateOfBirth = new DateTime(2000, 06, 01) },
                  new User { Id = "4", Email = "fabriceetverodehous@hotmail.com", NormalizedEmail = "FABRICEETVERODEHOUS@HOTMAIL.COM", NomHero = "LOU", UserName = "LOU", NormalizedUserName = "LOU", PasswordHash = "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", DateOfBirth = new DateTime(1980, 02, 22) },
                  new User { Id = "5", Email = "dejardinveronique.b159@hotmail.com", NormalizedEmail = "DEJARDINVERONIQUE.B159@HOTMAIL.COM", NomHero = "Icare", UserName = "Icare", NormalizedUserName = "ICARE", PasswordHash = "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", DateOfBirth = new DateTime(1982, 06, 01) },
 
                  new User { Id = "b74ddd14-6340-4840-95c2-db12554843e5", Email = "admin@hotmail.com", NormalizedEmail = "ADMIN@HOTMAIL.COM", NomHero = "admin", UserName = "admin", NormalizedUserName = "ADMIN", PasswordHash = "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==" } //password = admin

                );




        }


    }
}
