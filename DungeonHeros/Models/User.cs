using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DungeonHeros.Models
{
    public class User : IdentityUser
    {
        
        public DateTime DateOfBirth { get; set; }

        //public ICollection<Hero> Heros { get; set; }

        public ICollection<Team> Teams { get; set; }

        public string NomHero { get; set; }


    }
}
