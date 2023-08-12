using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class LvlDj : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "53ca4211-71ae-4129-b7df-62ea81080894", "d292437a-4e11-4ec8-8d0a-5df8f559a4fc" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "dc12d4a4-1fa2-40be-8759-0726a2e996b6", "a40ddb9b-c733-43b0-9de0-4e39ba4b189c" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "168a633f-e4ed-43ce-b2df-e266aceae796", "b6314b50-0d43-441f-8c02-4c6d022e2689" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "8b35fa21-0550-4654-8e50-85bc697f55b7", "2353d683-257d-4f8e-961b-f730b726b14b" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "e827adb0-2d77-431f-a41b-90e20b790cce", "9bbbe050-dfc1-4f77-82e8-438cff293d63" });

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "1",
                column: "Level",
                value: 24);

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "2",
                column: "Level",
                value: 42);

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "3",
                column: "Level",
                value: 55);

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "4",
                column: "Level",
                value: 10);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "57477137-ba06-4af6-8c6a-fd7c0bc235c8", "b53cc0fc-1e93-4194-bb5b-11acd894483a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "86974322-41ba-4109-9dec-92c9624d887e", "af54fa63-7f0c-4c53-9085-cf75a8481cb6" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "68d6dadf-75c0-4b0f-8a90-8536d49dd951", "b474c5f7-7552-489f-9290-84f182ee5219" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "4580aa4b-e916-4cb4-9a37-f58161d62123", "af0d3453-7b43-4d7c-84a4-81f52aa7ffb4" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "f4f1d6f0-3b4b-46d6-be3a-9d212f5c50f6", "5acde77f-9eab-4819-8c7e-b40587177e23" });

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "1",
                column: "Level",
                value: 0);

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "2",
                column: "Level",
                value: 0);

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "3",
                column: "Level",
                value: 0);

            migrationBuilder.UpdateData(
                table: "Dungeon",
                keyColumn: "Id",
                keyValue: "4",
                column: "Level",
                value: 0);
        }
    }
}
