using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DungeonHeros.Models.Configuration
{
    public class DungeonMonstreConfiguration : IEntityTypeConfiguration<DungeonMonstreRelation>
    {
        public void Configure(EntityTypeBuilder<DungeonMonstreRelation> builder)
        {

            builder.ToTable("DungeonMonstre");

            builder.HasData(

                new { DungeonsId = "1", MonstresNom = "Kobold", NbrMonstre = 5 },
                new { DungeonsId = "1", MonstresNom = "Ogre", NbrMonstre = 2 },
                new { DungeonsId = "1", MonstresNom = "Golem d’os", NbrMonstre = 1 },
                new { DungeonsId = "1", MonstresNom = "Serwaul", NbrMonstre = 1 },

                new { DungeonsId = "2", MonstresNom = "Efrit", NbrMonstre = 2 },
                new { DungeonsId = "2", MonstresNom = "Fafnir", NbrMonstre = 1 },
                new { DungeonsId = "2", MonstresNom = "Hydre", NbrMonstre = 1 },
                new { DungeonsId = "2", MonstresNom = "Vouivre", NbrMonstre = 2 },

                new { DungeonsId = "3", MonstresNom = "Dark Lord", NbrMonstre = 1 },
                new { DungeonsId = "3", MonstresNom = "Serwaul", NbrMonstre = 5 },

                new { DungeonsId = "4", MonstresNom = "Araignée", NbrMonstre = 2 },
                new { DungeonsId = "4", MonstresNom = "Chauve - Souris", NbrMonstre = 2 },
                new { DungeonsId = "4", MonstresNom = "Loup Geant", NbrMonstre = 1 }


                );
        }
    }
}
