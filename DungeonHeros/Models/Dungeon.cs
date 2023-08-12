

using System.ComponentModel.DataAnnotations.Schema;

namespace DungeonHeros.Models
{
    public class Dungeon
    {
        
        public string Id { get; set; }
        public string Name { get; set; }

        public int Level { get; set; }

        [NotMapped]
        public ICollection<Monstre> Monstres { get; set; }

        public string Image { get; set; }

    }
}
