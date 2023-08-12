using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class LevelHero : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<double>(
                name: "Lvl",
                table: "Hero",
                type: "float",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "0fcc7844-f287-46e0-b4b3-3ba77e436e58", "c0f4e305-6d8e-4a55-bcb3-f100c7644fda" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "00a56257-95d0-456f-942c-fba8245b1662", "ebec94cc-ecf1-4fd1-b2a3-8174ff0a2f15" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "3ccded1b-26a7-43b3-9e46-12e9e242b445", "d8f5f944-d139-464a-9a64-4ddf947d945e" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "a201c5f6-ff43-4ffa-8ae7-6a35cb321a99", "6d18f4cb-a6d2-4aae-83b1-7fe4adce60b6" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "64ffc414-1fdf-468e-bd11-9c411e7160aa", "fadcab0c-8172-49f3-b5fa-11b65d7baa69" });

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 1,
                column: "Lvl",
                value: 5.0);

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 2,
                column: "Lvl",
                value: 3.0);

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 3,
                column: "Lvl",
                value: 2.0);

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 4,
                column: "Lvl",
                value: 5.0);

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 5,
                column: "Lvl",
                value: 3.0);

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 6,
                column: "Lvl",
                value: 4.5);

            migrationBuilder.UpdateData(
                table: "Hero",
                keyColumn: "Id",
                keyValue: 7,
                column: "Lvl",
                value: 5.0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Lvl",
                table: "Hero");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "cb273942-8183-49a6-b947-22ade2620a43", "5e0e1c86-c351-4c0d-8e77-6a49939e858f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "001e41fb-559b-463e-8260-6bb3e0debc08", "2ed82c1d-4218-4ee1-b17a-88d19f22adec" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "c5f7f81f-9c11-4108-bf4c-f2a7fe70053b", "a43534e7-dc01-4009-9c78-85c9e3175f2a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "4f0c379f-8238-475f-aeab-ab28ee1e7ad9", "5cd83424-79d9-424b-a48e-1a561123e51a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "73228c19-b109-40db-9357-6478a99b4596", "79fd8c91-d387-4911-92c5-edf5a3ae25af" });
        }
    }
}
