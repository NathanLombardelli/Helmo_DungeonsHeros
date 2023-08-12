using DungeonHeros.Models;
using DungeonHeros.Models.ViewModel;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Security.Claims;

namespace DungeonHeros.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private UserManager<User> _userManager;
        private SignInManager<User> _signInManager;

        public HomeController(ILogger<HomeController> logger, [FromServices] UserManager<User> userManager, [FromServices] SignInManager<User> signInManager)
        {
            _logger = logger;
            _userManager = userManager;
            _signInManager = signInManager;
        }


        public string Heros([FromServices] DungeonHerosDbContext db)
        {
            /* Lecture */
            //include pour jointure ?
            //var hero = db.Teams.Include(t => t.Heros).ThenInclude();
            //  var hero = db.Teams.ToList();
            // var PremiereTeam = db.Teams.Where(t => t.Id == 1).ToList(); //where SQL.
            // var teamDeGhost = db.Teams.Where(t => t.Heros[0].Nom.Contains("Ghost")).ToList(); //where SQL.
            //var multiData = db.Teams.Select(obj => new {id = obj.Id, firstHero = obj.Heros[0]}).ToList();  // objet avec les propriéter voulue
            //   return hero[0].Heros[0].Nom;

            /* Ajout */

            /* db.Add(new Team { Id = default, Score = 0, Heros = new List<Hero> { new Hero { Id = default, Classe = 0, Endurance = 2, Force = 3, Nom = "Bobby", Race = 0 } } });
             db.SaveChanges();*/


            /* Modification */

            /*Team firstTeam = db.Teams.First();
            firstTeam.Score = 15;
            db.SaveChanges();

            ou

            Team firstTeam = new Team(){ id = 1 , Score = 20};
            db.Update(firstTeam);
            db.SaveChanges();

            */

            /* Suppresion */

            /*Team firstTeam = db.Teams.First();
            db.Remove(firstTeam);
            db.SaveChanges();*/


            return "";
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Profile()
        {
            return View();
        }

        public async Task<IActionResult> Teams([FromServices] DungeonHerosDbContext db)
        {
            //get l'user connecter et donner un model avec la list de ses teams.
            var usr = await _userManager.GetUserAsync(User);

            string UserId = usr.Id;

            var teams = getTeamUserConnected(db,usr);

            TeamViewModel model = new TeamViewModel();
            model.Teams = teams;

            return View(model);
        }

        private ICollection<Team> getTeamUserConnected(DungeonHerosDbContext db,User usr)
        {

            string UserId = usr.Id;

            var teams = db.Teams.Where(t => t.UserId == UserId).ToList();

            foreach (var team in teams)
            {
                var relation = db.HeroTeam.Where(HeroTeam => HeroTeam.TeamsId == team.Id).ToList();
                team.Heroes = new List<Hero>();
                team.UserId = team.UserId;

                foreach (var entity in relation)
                {
                    Hero hero = db.Hero.Where(Hero => Hero.Id == entity.HeroesId).ToList()[0];
                    team.Heroes.Add(hero);

                }

            }

            return teams;
        }

        [HttpPost]
        public async Task<IActionResult> Teams([FromServices] DungeonHerosDbContext db, string IdTeam, Boolean Delete)
        {

            if (Delete)
            {
                //suppresion team et heroTeam
                var team = db.Teams.Where(t => t.Id == IdTeam).ToList()[0];
                db.Teams.Remove(team);

                var TeamHero = db.HeroTeam.Where(ht => ht.TeamsId == IdTeam).ToList();
                foreach(var entity in TeamHero)
                {
                    db.HeroTeam.Remove(entity);
                }

                db.SaveChanges();

                var usr = await _userManager.GetUserAsync(User);
                var teams = getTeamUserConnected(db, usr);

                TeamViewModel model = new TeamViewModel();
                model.Teams = teams;

                return View(model);
            }
            else
            {

                
                var team = db.Teams.Where(t => t.Id == IdTeam).ToList()[0];

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

                return RedirectToAction("ModificationTeam", "Team", new { model = model, IdEquipe = IdTeam });
            }

        }

        //[Authorize(Policy = "Admin")]
        [Authorize]
        public IActionResult DungeonManagement([FromServices] DungeonHerosDbContext db)
        {

            DungeonManagementViewModel model = new DungeonManagementViewModel();

            IList<Dungeon> dungeonList = db.Dungeon.ToList();


            model.DungeonList = dungeonList;

            return View(model);
        }


        public IActionResult DungeonsList([FromServices] DungeonHerosDbContext db)
        {

            DungeonManagementViewModel model = new DungeonManagementViewModel();

            IList<Dungeon> dungeonList = db.Dungeon.ToList();

            model.DungeonList = dungeonList;

            return View(model);
        }

        [AllowAnonymous]
        public IActionResult HallOfFame([FromServices] DungeonHerosDbContext db)
        {

            // get list //

            HallOfFameViewModel model = new HallOfFameViewModel();
            var teamdb = db.Teams;
            IList<Team> teams = teamdb.OrderByDescending(t => t.Score).ToList();


            foreach (Team team in teams)
            {
                var relation = db.HeroTeam.Where(HeroTeam => HeroTeam.TeamsId == team.Id).ToList();
                team.Heroes = new List<Hero>();
                team.UserId = team.UserId;

                foreach (var entity in relation)
                {
                    Hero hero = db.Hero.Where(Hero => Hero.Id == entity.HeroesId).ToList()[0];
                    team.Heroes.Add(hero);

                }

            }


            model.Teams = teams;

            return View(model);
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}