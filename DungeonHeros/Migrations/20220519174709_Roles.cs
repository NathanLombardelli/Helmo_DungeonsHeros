using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class Roles : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "174001c9-3abb-40e4-b6f0-3cc57e0846f5", "ac332297-b9ba-41f8-8177-0b07c771f3de" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "912c3990-e3c0-403e-86b8-237d136670e1", "45392302-5ee8-4249-b685-2090cfc3021a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "4e3260a1-1b7c-4ecf-b132-d8062d223a47", "f54ffd6d-1c44-474b-961d-b2124932d156" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "7856f52e-3376-4a9b-8426-d4a5556b443a", "4009ad75-3f23-4e8d-b9b1-27f404c42889" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "5c788d25-3f70-4350-9f77-c50e3da4212e", "4ffacb53-5ce2-45cf-8577-c690e4ba1463" });
        }
    }
}
