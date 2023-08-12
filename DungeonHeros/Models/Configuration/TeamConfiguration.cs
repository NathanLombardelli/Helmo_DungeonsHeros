using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DungeonHeros.Models.Configuration
{
    public class TeamConfiguration : IEntityTypeConfiguration<Team>
    {
        public void Configure(EntityTypeBuilder<Team> builder)
        {

            builder.ToTable("Teams");

            builder.HasData(

                  new Team { Id = "1", Score = 0, UserId = "5" },
                  new Team { Id = "2", Score = 15, UserId = "5" },
                  new Team { Id = "3", Score = 10, UserId = "5" },
                  new Team { Id = "4", Score = 10, UserId = "5" },
                  new Team { Id = "5", Score = 5, UserId = "5" },
                  new Team { Id = "6", Score = 20, UserId = "5" },

                  new Team { Id = "7", Score = 45, UserId = "2" },
                  new Team { Id = "8", Score = 25 , UserId = "4" },
                  new Team { Id = "9", Score = 30, UserId = "3" }

                /*
                new Team { Id = "1", Score = 0 },
                new Team { Id = "2", Score = 15},

                new Team { Id = "3", Score = 10 },

                new Team
                {
                    Id = "4",
                    Score = 10,
                },

                new Team { Id = "5", Score = 5 },
                new Team { Id = "6", Score = 20 },

                new Team
                {
                    Id = "7",
                    Score = 45,
                },

                new Team
                {
                    Id = "8",
                    Score = 25,
                },

                new Team
                {
                    Id = "9",
                    Score = 30,
                } */

                );
               






        }
    }
}
