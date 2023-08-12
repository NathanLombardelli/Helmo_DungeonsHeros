using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class DungeonConfiguration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Dungeon",
                columns: new[] { "Id", "Image", "Level", "Name" },
                values: new object[,]
                {
                    { 1, ".../Images/cover.jpg", 0, "Les Terres Brules" },
                    { 2, ".../Images/IceDJ.jpg", 0, "Cours du hibou" },
                    { 3, ".../Images/Desert.jpg", 0, "Temple de hrakas" },
                    { 4, ".../Images/Forest.jpg", 0, "Foret celeste" }
                });

            migrationBuilder.InsertData(
                table: "Monster",
                columns: new[] { "Nom", "Avatar", "Endurance", "Force", "Race" },
                values: new object[,]
                {
                    { "Araignée", ".../Images/Monstre/spider.jpg", 2, 2, "Animal" },
                    { "Chauve - Souris", ".../Images/Monstre/bat.jpg", 2, 1, "Animal" },
                    { "Dark Lord", ".../Images/Monstre/DarkLord.png", 20, 20, "Démon" },
                    { "Efrit", ".../Images/Monstre/efrit.jpg", 4, 4, "Monstre" },
                    { "Fafnir", ".../Images/Monstre/Fafnir.png", 7, 9, "Dragon" },
                    { "Golem d’os", ".../Images/Monstre/Bone_Golem.jpg", 3, 5, "Monstre" },
                    { "Grougaloragran", ".../Images/Monstre/grougaloragran.jpg", 12, 4, "Dragon" },
                    { "Hydre", ".../Images/Monstre/hydra.jpg", 11, 5, "Monstre" },
                    { "Kobold", ".../Images/Monstre/kobold.jpg", 4, 2, "Monstre" },
                    { "Loup Geant", ".../Images/Monstre/wolf.jpg", 3, 4, "Animal" },
                    { "Ogre", ".../Images/Monstre/ogre.jpg", 3, 1, "Monstre" },
                    { "Serwaul", ".../Images/Monstre/serwaul.jpeg", 1, 7, "Démon" },
                    { "Vouivre", ".../Images/Monstre/wyvern.jpg", 15, 10, "Dragon" }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Araignée");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Chauve - Souris");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Dark Lord");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Efrit");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Fafnir");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Golem d’os");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Grougaloragran");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Hydre");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Kobold");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Loup Geant");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Ogre");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Serwaul");

            migrationBuilder.DeleteData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Vouivre");
        }
    }
}
