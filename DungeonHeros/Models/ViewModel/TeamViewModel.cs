namespace DungeonHeros.Models
{
    public class TeamViewModel
    {

        public Team Team{get;set;}
        public ICollection<Team> Teams { get; set; }

        public ICollection<Hero> HeroUser { get; set; }



    }
}
