using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DungeonHeros.Models
{
    public class Team
    {

        public string Id { get; set; }

        public int Score { get; set; }

        [NotMapped]
        public IList<Hero> Heroes { get; set; }


        public string UserId { get; set; }

    }
}
