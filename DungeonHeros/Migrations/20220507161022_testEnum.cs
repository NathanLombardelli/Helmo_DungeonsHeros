using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class testEnum : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Hero",
                columns: new[] { "Id", "Classe", "Endurance", "Force", "Image", "Nom", "Race", "TeamId" },
                values: new object[] { 1, "Guerrier", 7, 7, "Ghost.png", "Ghost", "Orc", null });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1);
        }
    }
}
