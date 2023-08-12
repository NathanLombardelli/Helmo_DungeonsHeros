using DungeonHeros.Models;
using DungeonHeros.Models.ViewModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace DungeonHeros.Controllers
{
    public class DungeonsController : Controller
    {
        private IWebHostEnvironment _hostingEnvironment;

        public DungeonsController(IWebHostEnvironment environment)
        {
            _hostingEnvironment = environment;
        }


        // GET: DungeonsController
        public ActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Combat(String NameDj, [FromServices] DungeonHerosDbContext db, [FromServices] UserManager<User> userManager)
        {

            Dungeon dj = db.Dungeon.Where(x => x.Name == NameDj).ToList()[0];

            CombatViewModel model = new CombatViewModel();
            model.Id = dj.Id;
            model.Image = dj.Image;
            model.Name = NameDj;
            model.Level = dj.Level;

            //get Team User
            //get l'user connecter et donner un model avec la list de ses teams.
            var usr = await userManager.GetUserAsync(User);

            var teams = getTeamUserConnected(db, usr);

            model.teams = teams;


            return View(model);
        }


        [HttpPost]
        public IActionResult Combat([FromServices] DungeonHerosDbContext db, string teamSelected, string idDj)
        {

            // force Monstre ( = Lvl dj)
            Dungeon dungeon = db.Dungeon.Where(x => x.Id == idDj).ToList()[0];

            int ForceMonstre = dungeon.Level;

            // force et endurance equipe

            double ForceEquipe = 0;
            double EnduranceEquipe = 0;


            Team team = db.Teams.Where(t => t.Id == teamSelected).ToList()[0];
            IList<Hero> heros = new List<Hero>();

            var relation = db.HeroTeam.Where(HeroTeam => HeroTeam.TeamsId == team.Id).ToList();

            foreach (var entity in relation)
            {
                Hero hero = db.Hero.Where(Hero => Hero.Id == entity.HeroesId).ToList()[0];
                heros.Add(hero);
                ForceEquipe += (hero.Force + Math.Round(hero.Lvl,2));
                EnduranceEquipe += (hero.Endurance + Math.Round(hero.Lvl, 2));

            }


            // endurance monstre

            int EnduranceMonstre = 0;

            var relationDjMonstre = db.DungeonMonstre.Where(dm => dm.DungeonsId == idDj).ToList();

            foreach (var entity in relationDjMonstre)
            {

                Monstre monstre = db.Monster.Where(m => m.Nom == entity.MonstresNom).ToList()[0];
                EnduranceMonstre += (monstre.Endurance * entity.NbrMonstre);

            }

            // facteur aléatoire

            Random rnd = new Random();
            double AleaEquip = rnd.Next(0, 30);
            AleaEquip = Math.Round(AleaEquip /10,2);


            double AleaMonstre = rnd.Next(0, 30);
            AleaMonstre = Math.Round(AleaMonstre /10,2);



            // Combat

            double resultMonstre = Math.Round((EnduranceMonstre * AleaMonstre) - (ForceEquipe * AleaEquip),2);

            double resultEquip = Math.Round((EnduranceEquipe * AleaEquip) - (ForceMonstre * AleaMonstre), 2);


            // Resultat 

            ResultatCombatViewModel model = new ResultatCombatViewModel();

            if (resultMonstre <= 0 && resultEquip >= 0.1)
            {
                //succes.
                double Xp = Math.Round(ForceMonstre / ForceEquipe,2);
                model.resultat = "Tu a vaincus les monstres du donjon, tes heros sont monter en niveaux";
                model.reussi = true;

                //ajouter xp aux lvl des heros 

                foreach (Hero hero in heros)
                {
                    var heroDb = db.Hero.First(h => h.Id == hero.Id);
                    heroDb.Lvl += Math.Round(Xp,2);

                }

                //ajouter point au score ?

                team.Score += 5;


                db.SaveChanges();


                return RedirectToAction("ResultatCombat", "Dungeons", new { resultat = "Tu a vaincus les monstres du donjon, tes heros sont monter en niveaux" , reussi = true}); ; // retourner vers succes


            }
            else if (resultMonstre <= 0 && resultEquip <= 0)
            {
                // lose
                model.resultat = "Tu a vaincus les monstres du donjon, mais tes heros ont succomber a leur blessures...reessaye le donjons ";
                model.reussi = false;
                return RedirectToAction("ResultatCombat", "Dungeons", new { resultat = "Tu a vaincus les monstres du donjon, mais tes heros ont succomber a leur blessures...reessaye le donjons ", reussi = false }); ; // retourner vers succes
            }
            else if (resultMonstre >= 0.1)
            {
                //lose
                model.resultat = "Tu n'a pas reussi a vaincre les monstres du donjon... reessaye un donjons de moins haut niveaux";
                model.reussi = false;
                return RedirectToAction("ResultatCombat", "Dungeons", new { resultat = "Tu n'a pas reussi a vaincre les monstres du donjon... reessaye un donjons de moins haut niveaux", reussi = false }); ; // retourner vers succes
            }

            return View();
        }


        public IActionResult ResultatCombat(string resultat,Boolean reussi)
        {
            ResultatCombatViewModel model = new ResultatCombatViewModel();
            model.resultat = resultat;
            model.reussi = reussi;

            return View(model);
        }


        private ICollection<Team> getTeamUserConnected(DungeonHerosDbContext db, User usr)
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

        public IActionResult Dungeons(String NameDj, [FromServices] DungeonHerosDbContext db)
        {

            DungeonViewModel model = new DungeonViewModel();

            Dungeon dj = db.Dungeon.Where(x => x.Name == NameDj).ToList()[0];

            model.Image = dj.Image;

            model.Name = NameDj;

            model.Monstres = db.Monster.ToList();

            model.Level = dj.Level;



            //get les monstres du dj
            model.MonstresDuDj = new Dictionary<string, int>();

            var dungeonMonstre = db.DungeonMonstre.Where(djm => djm.DungeonsId == dj.Id).ToList();

            foreach (var djm in dungeonMonstre)
            {
                model.MonstresDuDj.Add(djm.MonstresNom, djm.NbrMonstre);
            }

            return View(model);
        }

        public IActionResult DungeonCreation([FromServices] DungeonHerosDbContext db)
        {
            var model = new DungeonViewModel();

            model.Monstres = db.Monster.ToList();

            return View(model);
        }


        [HttpPost]
        public async Task<IActionResult> DungeonCreation([FromServices] DungeonHerosDbContext db, string[] NbrMonstres, string NomDj, int LvlDj, IFormFile Image)
        {

            string DjId = Guid.NewGuid().ToString();

            //image Dj
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
                //gestion erreur
            }

            if (fileName.Equals(""))
            {
                fileName = "placeholder-image.png";
            }

            //créer dj avant
            Dungeon dungeon = new Dungeon();
            dungeon.Level = LvlDj;
            dungeon.Name = NomDj;
            dungeon.Id = DjId;
            dungeon.Image = "/Images/" + fileName;

            db.Dungeon.Add(dungeon);



            foreach (string monstre in NbrMonstres)
            {
                var posDelim = monstre.IndexOf(';');
                var nomMonstre = monstre.Substring(0, posDelim - 1);
                var nbrMonstre = monstre.Substring(posDelim + 1);

                DungeonMonstreRelation dungeonMonstreRelation = new DungeonMonstreRelation();

                dungeonMonstreRelation.NbrMonstre = Int32.Parse(nbrMonstre);
                dungeonMonstreRelation.MonstresNom = nomMonstre;
                dungeonMonstreRelation.DungeonsId = DjId;

                if (Int32.Parse(nbrMonstre) != 0)
                {
                    db.DungeonMonstre.Add(dungeonMonstreRelation);
                }
            }


            db.SaveChanges();


            var model = new DungeonViewModel();

            model.Monstres = db.Monster.ToList();

            return View(model);
        }


        // GET: DungeonsController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: DungeonsController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: DungeonsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: DungeonsController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: DungeonsController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: DungeonsController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: DungeonsController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
