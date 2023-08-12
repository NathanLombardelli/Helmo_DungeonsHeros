using System.ComponentModel.DataAnnotations;

namespace DungeonHeros.Models
{
    public class Hero
    {
        [Key]
        public string Id { get; set; }

        [Required]
        public Race Race { get; set; }

        [Required]
        public Classe Classe { get; set; }

        [Required]
        [MaxLength(60)]
        public string Nom { get; set; }

        public string Image { get; set; }

        public double Lvl { get; set; } 

        [Required]
        [MaxLength(10)]
        public int Force { get; set; }

        [Required]
        [MaxLength(10)]
        public int Endurance { get; set; }


        public string UserID { get; set; }


       // public ICollection<Team> Teams { get; set; }

    }
}
