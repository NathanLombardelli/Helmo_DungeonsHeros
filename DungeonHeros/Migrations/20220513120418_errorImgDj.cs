using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class errorImgDj : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 1,
                column: "Image",
                value: "/Images/cover.jpg");

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 2,
                column: "Image",
                value: "/Images/IceDJ.jpg");

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 3,
                column: "Image",
                value: "/Images/Desert.jpg");

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 4,
                column: "Image",
                value: "/Images/Forest.jpg");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 1,
                column: "Image",
                value: ".../Images/cover.jpg");

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 2,
                column: "Image",
                value: ".../Images/IceDJ.jpg");

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 3,
                column: "Image",
                value: ".../Images/Desert.jpg");

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: 4,
                column: "Image",
                value: ".../Images/Forest.jpg");
        }
    }
}
