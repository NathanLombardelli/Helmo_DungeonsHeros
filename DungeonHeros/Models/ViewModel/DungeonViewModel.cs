namespace DungeonHeros.Models.ViewModel
{
    public class DungeonViewModel
    {

        public string Name { get; set; }
        public int Level { get; set; }

        public string Image { get; set; }

        public IList<Monstre> Monstres { get; set; }

        public IDictionary<string,int> MonstresDuDj { get; set; }


    }
}
