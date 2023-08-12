using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DungeonHeros.Models.Configuration
{
    public class HeroTeamConfiguration : IEntityTypeConfiguration<HeroTeamRelation>
    {
        public void Configure(EntityTypeBuilder<HeroTeamRelation> builder)
        {
            builder.ToTable("HeroTeam");

            builder.HasData(

                new { TeamsId = "7", HeroesId = "1" },
                new { TeamsId = "7", HeroesId = "2" },
                new { TeamsId = "7", HeroesId = "3" },
                new { TeamsId = "7", HeroesId = "4" },

                new { TeamsId = "9", HeroesId = "5" },
                new { TeamsId = "9", HeroesId = "6" },

                new { TeamsId = "8", HeroesId = "7" }



            );
        }
    }
}
