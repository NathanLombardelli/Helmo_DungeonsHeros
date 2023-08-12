using DungeonHeros.Models;
using DungeonHeros.Models.ViewModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace DungeonHeros.Controllers
{
    public class TeamController : Controller
    {
        private IWebHostEnvironment _hostingEnvironment;

        public TeamController(IWebHostEnvironment environment)
        {
            _hostingEnvironment = environment;
        }


        public async Task<IActionResult> ModificationTeam([FromServices]DungeonHerosDbContext db ,string IdEquipe, [FromServices] UserManager<User> userManager)// si passer un TeamViewModel => prop tj null ?
        {

            var team = db.Teams.Where(t => t.Id == IdEquipe).ToList()[0];

            var relation = db.HeroTeam.Where(HeroTeam => HeroTeam.TeamsId == team.Id).ToList();
            team.Heroes = new List<Hero>();
            team.UserId = team.UserId;

            foreach (var entity in relation)
            {
                Hero hero = db.Hero.Where(Hero => Hero.Id == entity.HeroesId).ToList()[0];
                team.Heroes.Add(hero);

            }

            TeamViewModel model = new TeamViewModel();
            model.Team = team;

            var usr = await userManager.GetUserAsync(User);

            model.HeroUser = db.Hero.Where(h => h.UserID == usr.Id).ToList();

            return View(model);
        }

        [HttpPost]
        public IActionResult ModificationTeam([FromServices]DungeonHerosDbContext db,string[] herosSelected,string idTeam)
        {

            if (herosSelected.Count() >= 5 || herosSelected.Count() == 0)
            {
                return View("ModificationTeam");// changer par l'envoie d'un viewModel.
            }

            // get la team 
            var Team = db.Teams.First(t => t.Id == idTeam);


            // get les heros 

            IList<Hero> heros = new List<Hero>();

            foreach (var heroId in herosSelected)
            {
                var Hero = db.Hero.First(h => h.Id == heroId);
                heros.Add(Hero);
            }


            IList<Classe> classes = new List<Classe>();

           /* foreach(var hero in heros)
            {
                
                if (!classes.Contains(hero.Classe))
                {
                    classes.Add(hero.Classe);
                }
                else
                {
                    return View("ModificationTeam");// changer par l'envoie d'un viewModel.
                }
                
            }*/

            var relation = db.HeroTeam.Where(ht => ht.TeamsId == idTeam).ToList();

            foreach (var entity in relation)
            {
                db.HeroTeam.Remove(entity);
            }

            foreach (var hero in heros)
            {
                HeroTeamRelation maRelation = new HeroTeamRelation();
                maRelation.TeamsId = idTeam;
                maRelation.HeroesId = hero.Id;

                db.HeroTeam.Add(maRelation);
            }


            db.SaveChanges();

            return View("ModificationTeam");// changer par l'envoie d'un viewModel.
        }

            public IActionResult CreationHero()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreationHero(IFormFile Image, string HeroName, Classe Classe, Race Race, int Force, int Endurance, [FromServices] DungeonHerosDbContext db, [FromServices] UserManager<User> userManager)
        {
            ///////////////faire une verif si nom hero existe deja (renvoie de formulaire)/////////////////////////

            var model = new MyErrorViewModel();

            if (Force + Endurance >= 8)
            {
                model.IsError = true;
                model.Message = "La somme de la force et de l'endurance ne peut pas etre superieur a 7";

                return View(model);
            }

            string fileName = "";

            try
            {

                string extension = Path.GetExtension(Image.FileName);
                fileName = Guid.NewGuid().ToString() + extension;

                //upload de l'image
                string filePath = Path.Combine(_hostingEnvironment.WebRootPath + "\\Images", fileName);
                using (Stream fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await Image.CopyToAsync(fileStream);
                }

            }
            catch
            {
                model.IsError = true;
                model.Message = "Une erreur est survenue avec l'image selectioner";

                return View(model);
            }

            try
            {

                string userId = userManager.GetUserId(User);

                string HeroId = Guid.NewGuid().ToString();

                if (fileName.Equals(""))
                {
                    fileName = "/Placeholder_hero.jpg";
                }

                // Hero
                Hero hero = new()
                {
                    Id = HeroId,
                    Lvl = 1.0,
                    Image = "/Images/"+fileName,
                    Endurance = Endurance,
                    Force = Force,
                    Nom = HeroName,
                    Classe = Classe,
                    Race = Race,
                    UserID = userId,
                };


                db.Hero.Add(hero);

                var userConnecter = await userManager.GetUserAsync(User);


                db.SaveChanges();

            }
            catch
            {
                model.IsError = true;
                model.Message = "un probleme est survenu lors de l'ajout du hero";

                return View(model);
            }

            model.IsError = false;
            model.Message = "le Hero " + HeroName + " a ete creer";

            return View(model);
        }

        public IActionResult CreationTeam()
        {
            return View();
        }

    }
}
