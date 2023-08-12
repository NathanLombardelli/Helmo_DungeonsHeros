using System.ComponentModel.DataAnnotations;

namespace DungeonHeros.Models
{
    public class Monstre
    {
        [Key]
        public string Nom { get; set; }

        public string Race { get; set; }

        public string Avatar { get; set; }

        public int Force { get; set; }

        public int Endurance { get; set; }

        //public ICollection<Dungeon> Dungeons { get; set; }

    }
}
