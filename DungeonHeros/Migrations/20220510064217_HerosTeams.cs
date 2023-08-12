using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class HerosTeams : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Hero_Teams_TeamId",
                table: "Hero");

            migrationBuilder.DropIndex(
                name: "IX_Hero_TeamId",
                table: "Hero");

            migrationBuilder.DropColumn(
                name: "TeamId",
                table: "Hero");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TeamId",
                table: "Hero",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Hero_TeamId",
                table: "Hero",
                column: "TeamId");

            migrationBuilder.AddForeignKey(
                name: "FK_Hero_Teams_TeamId",
                table: "Hero",
                column: "TeamId",
                principalTable: "Teams",
                principalColumn: "Id");
        }
    }
}
