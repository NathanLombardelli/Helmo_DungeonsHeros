using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class DungeonMonstre : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DungeonMonstre_Dungeon_DungeonsId",
                table: "DungeonMonstre");

            migrationBuilder.DropForeignKey(
                name: "FK_DungeonMonstre_Monster_MonstresNom",
                table: "DungeonMonstre");

            migrationBuilder.DropIndex(
                name: "IX_DungeonMonstre_MonstresNom",
                table: "DungeonMonstre");

            migrationBuilder.AddColumn<int>(
                name: "NbrMonstre",
                table: "DungeonMonstre",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.InsertData(
                table: "DungeonMonstre",
                columns: new[] { "DungeonsId", "MonstresNom", "NbrMonstre" },
                values: new object[,]
                {
                    { 1, "Golem d’os", 1 },
                    { 1, "Kobold", 5 },
                    { 1, "Ogre", 2 },
                    { 1, "Serwaul", 1 },
                    { 2, "Efrit", 2 },
                    { 2, "Fafnir", 1 },
                    { 2, "Hydre", 1 },
                    { 2, "Vouivre", 2 },
                    { 3, "Dark Lord", 1 },
                    { 3, "Serwaul", 5 },
                    { 4, "Araignée", 2 },
                    { 4, "Chauve - Souris", 2 },
                    { 4, "Loup Geant", 1 }
                });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Magicien", "Nain" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Guerrier", "Orc" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Archer", "Elf" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Magicien", "Humain" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Voleur", "Nain" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Archer", "Orc" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "Classe", "Nom", "Race" },
                values: new object[] { "Guerrier", "Aldin", "Elf" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 1, "Golem d’os" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 1, "Kobold" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 1, "Ogre" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 1, "Serwaul" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 2, "Efrit" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 2, "Fafnir" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 2, "Hydre" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 2, "Vouivre" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 3, "Dark Lord" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 3, "Serwaul" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 4, "Araignée" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 4, "Chauve - Souris" });

            migrationBuilder.DeleteData(
                table: "DungeonMonstre",
                keyColumns: new[] { "DungeonsId", "MonstresNom" },
                keyValues: new object[] { 4, "Loup Geant" });

            migrationBuilder.DropColumn(
                name: "NbrMonstre",
                table: "DungeonMonstre");

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Guerrier", "Orc" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Archer", "Elf" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Voleur", "Humain" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Guerrier", "4" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "4", "Orc" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "Classe", "Race" },
                values: new object[] { "Voleur", "Elf" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "Classe", "Nom", "Race" },
                values: new object[] { "Archer", "aldin", "Humain" });

            migrationBuilder.CreateIndex(
                name: "IX_DungeonMonstre_MonstresNom",
                table: "DungeonMonstre",
                column: "MonstresNom");

            migrationBuilder.AddForeignKey(
                name: "FK_DungeonMonstre_Dungeon_DungeonsId",
                table: "DungeonMonstre",
                column: "DungeonsId",
                principalTable: "Dungeon",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_DungeonMonstre_Monster_MonstresNom",
                table: "DungeonMonstre",
                column: "MonstresNom",
                principalTable: "Monster",
                principalColumn: "Nom",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
