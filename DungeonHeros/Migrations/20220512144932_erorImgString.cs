using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class erorImgString : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                column: "Image",
                value: "/Images/nainVoleur.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 2,
                column: "Image",
                value: "/Images/orcGuerrier.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 3,
                column: "Image",
                value: "/Images/elfeArcher.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 4,
                column: "Image",
                value: "/Images/humainSorcier.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 5,
                column: "Image",
                value: "/Images/nainVoleur.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 6,
                column: "Image",
                value: "/Images/orcGuerrier.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 7,
                column: "Image",
                value: "/Images/elfeArcher.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Araignée",
                column: "Avatar",
                value: "/Images/Monstre/spider.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Chauve - Souris",
                column: "Avatar",
                value: "/Images/Monstre/bat.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Dark Lord",
                column: "Avatar",
                value: "/Images/Monstre/DarkLord.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Efrit",
                column: "Avatar",
                value: "/Images/Monstre/efrit.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Fafnir",
                column: "Avatar",
                value: "/Images/Monstre/Fafnir.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Golem d’os",
                column: "Avatar",
                value: "/Images/Monstre/Bone_Golem.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Grougaloragran",
                column: "Avatar",
                value: "/Images/Monstre/grougaloragran.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Hydre",
                column: "Avatar",
                value: "/Images/Monstre/hydra.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Kobold",
                column: "Avatar",
                value: "/Images/Monstre/kobold.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Loup Geant",
                column: "Avatar",
                value: "/Images/Monstre/wolf.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Ogre",
                column: "Avatar",
                value: "/Images/Monstre/ogre.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Serwaul",
                column: "Avatar",
                value: "/Images/Monstre/serwaul.jpeg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Vouivre",
                column: "Avatar",
                value: "/Images/Monstre/wyvern.jpg");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                column: "Image",
                value: ".../Images/nainVoleur.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 2,
                column: "Image",
                value: ".../Images/orcGuerrier.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 3,
                column: "Image",
                value: ".../Images/elfeArcher.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 4,
                column: "Image",
                value: ".../Images/humainSorcier.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 5,
                column: "Image",
                value: ".../Images/nainVoleur.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 6,
                column: "Image",
                value: ".../Images/orcGuerrier.jpg");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 7,
                column: "Image",
                value: ".../Images/elfeArcher.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Araignée",
                column: "Avatar",
                value: ".../Images/Monstre/spider.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Chauve - Souris",
                column: "Avatar",
                value: ".../Images/Monstre/bat.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Dark Lord",
                column: "Avatar",
                value: ".../Images/Monstre/DarkLord.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Efrit",
                column: "Avatar",
                value: ".../Images/Monstre/efrit.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Fafnir",
                column: "Avatar",
                value: ".../Images/Monstre/Fafnir.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Golem d’os",
                column: "Avatar",
                value: ".../Images/Monstre/Bone_Golem.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Grougaloragran",
                column: "Avatar",
                value: ".../Images/Monstre/grougaloragran.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Hydre",
                column: "Avatar",
                value: ".../Images/Monstre/hydra.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Kobold",
                column: "Avatar",
                value: ".../Images/Monstre/kobold.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Loup Geant",
                column: "Avatar",
                value: ".../Images/Monstre/wolf.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Ogre",
                column: "Avatar",
                value: ".../Images/Monstre/ogre.jpg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Serwaul",
                column: "Avatar",
                value: ".../Images/Monstre/serwaul.jpeg");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Vouivre",
                column: "Avatar",
                value: ".../Images/Monstre/wyvern.jpg");
        }
    }
}
