using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class HeroTeam : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "HeroTeam",
                columns: table => new
                {
                    IdHero = table.Column<int>(type: "int", nullable: false),
                    IdTeam = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HeroTeam", x => new { x.IdTeam, x.IdHero });
                });

            migrationBuilder.InsertData(
                table: "HeroTeam",
                columns: new[] { "IdHero", "IdTeam" },
                values: new object[,]
                {
                    { 1, 7 },
                    { 2, 7 },
                    { 3, 7 },
                    { 4, 7 },
                    { 7, 8 },
                    { 5, 9 },
                    { 6, 9 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "HeroTeam");
        }
    }
}
