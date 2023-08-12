using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class DungeonMonster : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Dungeon",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Level = table.Column<int>(type: "int", nullable: false),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dungeon", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Monstre",
                columns: table => new
                {
                    Nom = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Race = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Avatar = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Force = table.Column<int>(type: "int", nullable: false),
                    Endurance = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Monstre", x => x.Nom);
                });

            migrationBuilder.CreateTable(
                name: "DungeonMonstre",
                columns: table => new
                {
                    DungeonsId = table.Column<int>(type: "int", nullable: false),
                    MonstresNom = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DungeonMonstre", x => new { x.DungeonsId, x.MonstresNom });
                    table.ForeignKey(
                        name: "FK_DungeonMonstre_Dungeon_DungeonsId",
                        column: x => x.DungeonsId,
                        principalTable: "Dungeon",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_DungeonMonstre_Monstre_MonstresNom",
                        column: x => x.MonstresNom,
                        principalTable: "Monstre",
                        principalColumn: "Nom",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DungeonMonstre_MonstresNom",
                table: "DungeonMonstre",
                column: "MonstresNom");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DungeonMonstre");

            migrationBuilder.DropTable(
                name: "Dungeon");

            migrationBuilder.DropTable(
                name: "Monstre");
        }
    }
}
