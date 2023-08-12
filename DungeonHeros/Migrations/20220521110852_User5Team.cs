using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class User5Team : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "6310a63f-e8a5-42f1-a2b3-7ca63a69c724", "127cb51f-c0cf-4ff2-957a-de5266d41070" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "1c85dc0e-ca40-4b7e-ba99-c9b907b740e1", "c678213c-e702-4807-9fdc-46cecad28ba8" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "cf696099-bfbe-4254-8de7-19562491d130", "9ba6dcb6-c9fe-40ca-9abe-37d05004384f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "56f5f78a-c788-40ed-a4bf-17e07f0d02b3", "7527be44-0999-435f-ab08-9d66930a393e" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "168967ef-70f5-4f66-91a5-98e74bd6bd28", "8b5bfb4d-1bf3-4bbf-873c-376f0f5d7ad6" });

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "1",
                column: "UserId",
                value: "5");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "2",
                column: "UserId",
                value: "5");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "3",
                column: "UserId",
                value: "5");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "4",
                column: "UserId",
                value: "5");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "5",
                column: "UserId",
                value: "5");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "6",
                column: "UserId",
                value: "5");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "23b8b436-fd53-49b5-9f9f-5a8cace5ad5a", "ee155784-b60e-41ab-9cf6-ab440fc40e9d" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "d5cce517-d3fa-497b-8afe-7cbce80b40dd", "f299203a-e8c3-4531-a7e0-ecba411c0f75" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "3174b0b5-70ef-4532-b3a2-a79094237cbd", "34a2ade4-26d7-4b9f-bcb2-bb9a85a18412" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "b64aeb49-9faf-4106-8a33-a6e036323bb6", "7debf448-7a1e-4fe9-b325-aac79bed2358" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "9c2aa1f5-54a2-4979-94d3-bc41d54ab3cf", "31109232-f1fd-4149-acdd-467721553485" });

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "1",
                column: "UserId",
                value: "2");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "2",
                column: "UserId",
                value: "2");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "3",
                column: "UserId",
                value: "2");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "4",
                column: "UserId",
                value: "2");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "5",
                column: "UserId",
                value: "2");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "6",
                column: "UserId",
                value: "2");
        }
    }
}
