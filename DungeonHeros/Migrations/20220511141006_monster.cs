using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class monster : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DungeonMonstre_Monstre_MonstresNom",
                table: "DungeonMonstre");

            migrationBuilder.DropForeignKey(
                name: "FK_Hero_User_UserId",
                table: "Hero");

            migrationBuilder.DropPrimaryKey(
                name: "PK_User",
                table: "User");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Monstre",
                table: "Monstre");

            migrationBuilder.RenameTable(
                name: "User",
                newName: "users");

            migrationBuilder.RenameTable(
                name: "Monstre",
                newName: "Monster");

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "Teams",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_users",
                table: "users",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Monster",
                table: "Monster",
                column: "Nom");

            migrationBuilder.InsertData(
                table: "users",
                columns: new[] { "Id", "DateOfBirth", "Mail", "NomHero", "Password" },
                values: new object[,]
                {
                    { 1, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "admin", "admin", "admin" },
                    { 2, new DateTime(2000, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "ghostkiller598r@gmail.com", "Ghostkiller", "qwerty" },
                    { 3, new DateTime(2000, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "nathanlombardelli@hotmail.com", "Ghost", "qwerty" },
                    { 4, new DateTime(1980, 2, 22, 0, 0, 0, 0, DateTimeKind.Unspecified), "fabriceetverodehous@hotmail.com", "LOU", "FLloulou" },
                    { 5, new DateTime(1982, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "dejardinveronique.b159@hotmail.com", "Icare", "dejdej" }
                });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Endurance", "Force", "Image", "Nom", "UserId" },
                values: new object[] { 5, 2, ".../Images/nainVoleur.jpg", "Torain", 2 });

            migrationBuilder.InsertData(
                table: "Hero",
                columns: new[] { "Id", "Classe", "Endurance", "Force", "Image", "Nom", "Race", "UserId" },
                values: new object[,]
                {
                    { 2, "Archer", 2, 5, ".../Images/orcGuerrier.jpg", "Gurldac", "Elf", 2 },
                    { 3, "Voleur", 4, 3, ".../Images/elfeArcher.jpg", "Oldin", "Humain", 2 },
                    { 4, "Guerrier", 6, 1, ".../Images/humainSorcier.jpg", "Didier", "4", 2 },
                    { 5, "4", 2, 4, ".../Images/nainVoleur.jpg", "Gibli", "Orc", 3 },
                    { 6, "Voleur", 1, 6, ".../Images/orcGuerrier.jpg", "Gorduc", "Elf", 3 },
                    { 7, "Archer", 3, 2, ".../Images/elfeArcher.jpg", "aldin", "Humain", 4 }
                });

            migrationBuilder.InsertData(
                table: "Teams",
                columns: new[] { "Id", "Score", "UserId" },
                values: new object[,]
                {
                    { 1, 0, 2 },
                    { 2, 15, 1 },
                    { 3, 10, 1 },
                    { 4, 10, 1 },
                    { 5, 5, 2 },
                    { 6, 20, 3 },
                    { 7, 45, 2 },
                    { 8, 25, 3 },
                    { 9, 30, 3 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Teams_UserId",
                table: "Teams",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_DungeonMonstre_Monster_MonstresNom",
                table: "DungeonMonstre",
                column: "MonstresNom",
                principalTable: "Monster",
                principalColumn: "Nom",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Hero_users_UserId",
                table: "Hero",
                column: "UserId",
                principalTable: "users",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Teams_users_UserId",
                table: "Teams",
                column: "UserId",
                principalTable: "users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DungeonMonstre_Monster_MonstresNom",
                table: "DungeonMonstre");

            migrationBuilder.DropForeignKey(
                name: "FK_Hero_users_UserId",
                table: "Hero");

            migrationBuilder.DropForeignKey(
                name: "FK_Teams_users_UserId",
                table: "Teams");

            migrationBuilder.DropIndex(
                name: "IX_Teams_UserId",
                table: "Teams");

            migrationBuilder.DropPrimaryKey(
                name: "PK_users",
                table: "users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Monster",
                table: "Monster");

            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "users",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "users",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "users",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "users",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "users",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Teams");

            migrationBuilder.RenameTable(
                name: "users",
                newName: "User");

            migrationBuilder.RenameTable(
                name: "Monster",
                newName: "Monstre");

            migrationBuilder.AddPrimaryKey(
                name: "PK_User",
                table: "User",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Monstre",
                table: "Monstre",
                column: "Nom");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Endurance", "Force", "Image", "Nom", "UserId" },
                values: new object[] { 7, 7, "Ghost.png", "Ghost", null });

            migrationBuilder.AddForeignKey(
                name: "FK_DungeonMonstre_Monstre_MonstresNom",
                table: "DungeonMonstre",
                column: "MonstresNom",
                principalTable: "Monstre",
                principalColumn: "Nom",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Hero_User_UserId",
                table: "Hero",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id");
        }
    }
}
