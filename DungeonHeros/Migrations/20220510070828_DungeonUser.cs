using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class DungeonUser : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "idTeam",
                table: "HerosTeams",
                newName: "IdTeam");

            migrationBuilder.RenameColumn(
                name: "idHero",
                table: "HerosTeams",
                newName: "IdHero");

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "Hero",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Mail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NomHero = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Hero_UserId",
                table: "Hero",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Hero_User_UserId",
                table: "Hero",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Hero_User_UserId",
                table: "Hero");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropIndex(
                name: "IX_Hero_UserId",
                table: "Hero");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Hero");

            migrationBuilder.RenameColumn(
                name: "IdTeam",
                table: "HerosTeams",
                newName: "idTeam");

            migrationBuilder.RenameColumn(
                name: "IdHero",
                table: "HerosTeams",
                newName: "idHero");
        }
    }
}
