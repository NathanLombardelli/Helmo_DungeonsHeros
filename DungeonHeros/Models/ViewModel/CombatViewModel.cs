namespace DungeonHeros.Models.ViewModel
{
    public class CombatViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }

        public string Image { get; set; }

        public IDictionary<string, int> MonstresDuDj { get; set; }

        public ICollection<Team> teams { get; set; }

    }
}
