using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class UserName : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "a362e03d-ea61-46f9-b6af-0cd906e2e0c4", "e4583bae-1a60-4f62-925d-ed6efeea11f2", "admin" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "9fab3981-2054-41cb-8cc7-023728b98ea6", "5850321a-537b-4a42-aafd-e4c9521647a9", "Ghostkiller" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "db788135-60ef-4efd-8663-d04c5c82348c", "250f53d0-bb5a-4ddc-b01c-cc0319337803", "Ghost" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "bd8bc52e-9cd6-49c3-a85f-0e5addda782b", "2799fc23-caa0-471f-8313-d8d6ce73006b", "LOU" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "606ceea4-20af-4792-b1bd-d3f7dea5fc13", "c0ee5d40-f56f-4e42-9319-636d574b20e0", "Icare" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "b41fd7c7-a59e-40aa-9e4e-edfcc5fbe4f7", "22c02b82-f84a-4117-99ee-6ede6568e9ac", null });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "3996a542-49ab-4ba9-b643-65cdf367f988", "eb0bccb9-4ad6-4d6f-934d-7aa3722b1856", null });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "2e135d40-a803-4ae0-8e30-bc00686db892", "5224f0be-2c1b-48aa-8c63-f74313bb2f61", null });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "99e95943-737d-4394-9695-b385bc8469fd", "a65afb01-8acf-420f-a41e-2bf2c2983f71", null });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp", "UserName" },
                values: new object[] { "a9759ddf-ef38-45a1-b733-37a13721ffab", "1c844161-6be8-430b-ad47-f51c65d7611c", null });
        }
    }
}
