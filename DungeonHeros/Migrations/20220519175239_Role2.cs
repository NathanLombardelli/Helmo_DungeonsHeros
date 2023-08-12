using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class Role2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "25011ef7-bd3a-4a01-a155-274fb12bb117", "01d22395-1e3c-48ad-8d56-3f236632258a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "3599d339-b194-4ef5-ab21-08d1450f0759", "ab87a78f-5fb3-408b-b437-bb7d71704819" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "d7228cbd-00ec-4e8e-9efc-fa2326297f85", "785be137-ee57-4886-91b4-40eb9994f7d2" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "61f0a2b7-1c32-4a4a-91fd-8b0399364f44", "4d749860-d7b8-44f6-88ff-5ad4ed7a9b0f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "83ab4aac-323c-44fe-92c4-db10d8ec7bea", "6dca74ae-40a4-42bc-98d0-288af7d790ff" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "c80dbcc3-9258-4509-a444-71ba70bbedd9", "78e9b0c5-7f42-4333-90ee-744c5eb866c4" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "269ab791-1f43-46d8-a76d-d39049febf80", "68226bdc-00ac-48c7-b0dd-f5e157ac7da2" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "d087c347-c88d-43e4-bd52-81f901477177", "58b9fb6e-eff7-4c72-ba84-50b3a3fe04ad" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "c12f825f-95a6-48a4-8113-162248605926", "9c6499e8-1bf1-4aa4-b587-5f07a5d7c1b5" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "22f8892d-a92e-4e20-92d9-00ba2af0ade2", "04fa5393-9161-4b75-8e71-036213193b9a" });
        }
    }
}
