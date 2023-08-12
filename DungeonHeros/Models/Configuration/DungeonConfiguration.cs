using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DungeonHeros.Models.Configuration
{
    public class DungeonConfiguration : IEntityTypeConfiguration<Dungeon>
    {
        public void Configure(EntityTypeBuilder<Dungeon> builder)
        {

            builder.ToTable("Dungeon");

            builder.HasData(

                    new Dungeon() { Id = "1", Name = "Les Terres Brules", Image = "/Images/cover.jpg", Level = 24},
                    new Dungeon() { Id = "2", Name = "Cours du hibou", Image = "/Images/IceDJ.jpg", Level = 42 },
                    new Dungeon() { Id = "3", Name = "Temple de hrakas", Image = "/Images/Desert.jpg", Level = 55 },
                    new Dungeon() { Id = "4", Name = "Foret celeste", Image = "/Images/Forest.jpg", Level = 10 }

                );


        }
    }
}
