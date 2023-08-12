using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DungeonHeros.Models.Configuration
{
    public class HeroConfiguration : IEntityTypeConfiguration<Hero>
    {
        public void Configure(EntityTypeBuilder<Hero> builder)
        {
            
            builder.ToTable("Hero");

            builder.HasData(

                new Hero { Id = "1", Classe = (Classe)0, Race = (Race)0, Force = 2, Endurance = 5, Lvl = 5.0, Image = "/Images/nainVoleur.jpg", Nom = "Torain", UserID = "2" },
                new Hero { Id = "2", Classe = (Classe)1, Race = (Race)1, Force = 5, Endurance = 2, Lvl = 3.0, Image = "/Images/orcGuerrier.jpg", Nom = "Gurldac", UserID = "2" },
                new Hero { Id = "3", Classe = (Classe)2, Race = (Race)2, Force = 3, Endurance = 4, Lvl = 2.0, Image = "/Images/elfeArcher.jpg", Nom = "Oldin", UserID = "2" },
                new Hero { Id = "4", Classe = (Classe)3, Race = (Race)3, Force = 1, Endurance = 6, Lvl = 5.0, Image = "/Images/humainSorcier.jpg", Nom = "Didier", UserID = "2" },
                
                new Hero { Id = "5", Classe = (Classe)3, Race = (Race)0, Force = 4, Endurance = 2, Lvl = 3.0, Image = "/Images/nainVoleur.jpg", Nom = "Gibli", UserID = "3" },
                new Hero { Id = "6", Classe = (Classe)2, Race = (Race)1, Force = 6, Endurance = 1, Lvl = 4.5, Image = "/Images/orcGuerrier.jpg", Nom = "Gorduc", UserID = "3" },
               
                new Hero { Id = "7", Classe = (Classe)1, Race = (Race)2, Force = 2, Endurance = 3,Lvl = 5.0, Image = "/Images/elfeArcher.jpg", Nom = "Aldin", UserID = "4" }



                );
        }
    }
}
