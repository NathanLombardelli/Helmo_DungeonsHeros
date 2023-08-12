using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DungeonHeros.Models.Configuration
{
    public class MonsterConfiguration : IEntityTypeConfiguration<Monstre>
    {
        public void Configure(EntityTypeBuilder<Monstre> builder)
        {

            builder.ToTable("Monster");

            builder.HasData(

                    new Monstre() { Nom = "Araignée",Race= "Animal", Force = 2, Endurance = 2, Avatar= "/Images/Monstre/spider.png"},
                    new Monstre() { Nom = "Chauve - Souris", Race = "Animal", Force = 1, Endurance = 2,  Avatar = "/Images/Monstre/bat.png" },
                    new Monstre() { Nom = "Dark Lord", Race = "Démon", Force = 20, Endurance = 20, Avatar = "/Images/Monstre/DarkLord.png" },
                    new Monstre() { Nom = "Efrit", Race = "Monstre", Force = 4, Endurance = 4, Avatar = "/Images/Monstre/efrit.png" },
                    new Monstre() { Nom = "Fafnir", Race = "Dragon", Force = 9, Endurance = 7, Avatar = "/Images/Monstre/Fafnir.png" },
                    new Monstre() { Nom = "Golem d’os", Race = "Monstre", Force = 5, Endurance = 3, Avatar = "/Images/Monstre/Bone_Golem.jpg" },
                    new Monstre() { Nom = "Grougaloragran", Race = "Dragon", Force = 4, Endurance = 12, Avatar = "/Images/Monstre/grougaloragran.png" },
                    new Monstre() { Nom = "Hydre", Race = "Monstre", Force = 5, Endurance = 11, Avatar = "/Images/Monstre/hydra.png" },
                    new Monstre() { Nom = "Kobold", Race = "Monstre", Force = 2, Endurance = 4, Avatar = "/Images/Monstre/kobold.png" },
                    new Monstre() { Nom = "Loup Geant", Race = "Animal", Force = 4, Endurance = 3, Avatar = "/Images/Monstre/wolf.png" },
                    new Monstre() { Nom = "Ogre", Race = "Monstre", Force = 1, Endurance = 3, Avatar = "/Images/Monstre/ogre.png" },
                    new Monstre() { Nom = "Serwaul", Race = "Démon", Force = 7, Endurance = 1, Avatar = "/Images/Monstre/serwaul.png" },
                    new Monstre() { Nom = "Vouivre", Race = "Dragon", Force = 10, Endurance = 15, Avatar = "/Images/Monstre/wyvern.png" }
                );

        }
    }
}
