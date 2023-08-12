using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class Register : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "397a6279-9460-4f62-9fe1-e9263b5a316f", "4d7ffc8a-bc90-487d-8123-68c183a328c5" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "c5003f01-f239-4fdb-bc59-fca18d936b90", "55d98ba1-e30e-41cc-bb26-2f151b7ea56c" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "3f099541-5e21-48f1-88c3-9965fb947066", "eb3fca14-7416-44b7-8c69-9f07f7d2b910" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "7ca07714-14fc-440b-9379-c75d8360e813", "d1ac623e-b70e-4219-9442-333dab8caed4" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "b9500854-2eb7-498f-a5b0-5b8af98898cc", "ed2155d0-6616-488e-b289-4e63cffc7aa0" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
        }
    }
}
