using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class transImgMonstre : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Araignée",
                column: "Avatar",
                value: "/Images/Monstre/spider.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Chauve - Souris",
                column: "Avatar",
                value: "/Images/Monstre/bat.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Efrit",
                column: "Avatar",
                value: "/Images/Monstre/efrit.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Grougaloragran",
                column: "Avatar",
                value: "/Images/Monstre/grougaloragran.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Hydre",
                column: "Avatar",
                value: "/Images/Monstre/hydra.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Kobold",
                column: "Avatar",
                value: "/Images/Monstre/kobold.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Loup Geant",
                column: "Avatar",
                value: "/Images/Monstre/wolf.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Ogre",
                column: "Avatar",
                value: "/Images/Monstre/ogre.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Serwaul",
                column: "Avatar",
                value: "/Images/Monstre/serwaul.png");

            migrationBuilder.UpdateData(
                table: "Monster",
                keyColumn: "Nom",
                keyValue: "Vouivre",
                column: "Avatar",
                value: "/Images/Monstre/wyvern.png");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
                keyValue: "Efrit",
                column: "Avatar",
                value: "/Images/Monstre/efrit.jpg");

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
    }
}
