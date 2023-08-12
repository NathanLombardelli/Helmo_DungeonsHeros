using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class IdentityUser : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "a362e03d-ea61-46f9-b6af-0cd906e2e0c4", "e4583bae-1a60-4f62-925d-ed6efeea11f2" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "9fab3981-2054-41cb-8cc7-023728b98ea6", "5850321a-537b-4a42-aafd-e4c9521647a9" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "db788135-60ef-4efd-8663-d04c5c82348c", "250f53d0-bb5a-4ddc-b01c-cc0319337803" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "bd8bc52e-9cd6-49c3-a85f-0e5addda782b", "2799fc23-caa0-471f-8313-d8d6ce73006b" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "606ceea4-20af-4792-b1bd-d3f7dea5fc13", "c0ee5d40-f56f-4e42-9319-636d574b20e0" });
        }
    }
}
