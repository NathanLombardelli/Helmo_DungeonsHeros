using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class Normalized : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "1a39948f-0a0a-405b-af07-565c72ac77e8", "GHOSTKILLER598R@GMAIL.COM", "GHOSTKILLER", "4c82b8de-9df5-471a-8046-d13c67e0861b" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "c153c4bd-08c1-468d-af6c-0f0672d322d8", "NATHANLOMBARDELLI@HOTMAIL.COM", "GHOST", "d05018e4-28f9-4036-882d-1daa40d75c4f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "98237ade-97aa-456b-87df-c126254758eb", "FABRICEETVERODEHOUS@HOTMAIL.COM", "LOU", "edd8964b-4a02-4306-aada-1d1f55f83381" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "4da1f5bb-251a-4c06-8218-c53de54760b7", "DEJARDINVERONIQUE.B159@HOTMAIL.COM", "ICARE", "2b066bae-b728-4534-8f40-1cc7ff4a2e8f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "Email", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "ca39eebc-111a-4053-abc1-40d0a24f9009", "admin@hotmail.com", "ADMIN@HOTMAIL.COM", "ADMIN", "b1e55a5d-1938-42c1-8f78-8d385f0b9118" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "94a7c5cd-4b11-4750-86d1-b92c03be91a9", null, null, "1bfcfaa4-4d76-4bb7-b66a-05d074a28309" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "63f8e289-d302-49ef-8229-bb5b6ac2b18f", null, null, "1b4178d4-037c-4802-bcfb-e1e1d2a5dc2e" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "67a86722-8f2d-49a5-ada4-6deeaceb2d7f", null, null, "88e6a9e2-fde9-4bbb-a26b-2712c6f98544" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "ea31ce84-8a78-4539-b1f1-d70c757e5880", null, null, "27c10941-25f1-48e4-a259-42eb735492a3" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "Email", "NormalizedEmail", "NormalizedUserName", "SecurityStamp" },
                values: new object[] { "3cfc03aa-64cc-496a-8075-279b8cfe5ebe", "admin", null, null, "043c832d-1856-470b-80ff-bc8fe16bd486" });
        }
    }
}
