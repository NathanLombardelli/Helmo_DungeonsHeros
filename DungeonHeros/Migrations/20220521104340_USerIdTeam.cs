using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class USerIdTeam : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "0e8ac540-613f-4660-a65a-1965d0fd1d29", "f25735ab-91c1-4852-b770-f715395f9f32" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "c0c1d1f1-2f9b-47ec-8ea3-fb0f760705d2", "cb360540-6138-4771-ae95-5e4885aacee5" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "67fbdaa9-e61e-41aa-9080-0707c105185d", "da4e78a2-f6ab-4e2a-9627-982e79a3f942" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "dc0632f8-0d28-4298-a980-5a91a861e802", "f679ecfe-0b36-41c0-a1c5-8b1309fcae4d" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "dcae25a3-83c1-4dd6-bd28-d5d557ca1c96", "dc7d860e-ee4f-49cd-bc6b-5d67feacbb75" });

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

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "7",
                column: "UserId",
                value: "2");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "8",
                column: "UserId",
                value: "4");

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "9",
                column: "UserId",
                value: "3");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "bc6e86cc-86d9-40f8-81ed-03d01262c3d4", "d0433e47-e67d-45f9-8c06-3cd2194c388a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "4d39deee-7c2b-4740-9f4a-c9bf1e2e0384", "d2876380-d31d-4eb7-a6f0-f5956e9a4633" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "7759c69b-e3e4-4d87-a247-9052aefa2d51", "490bbcb0-53e9-4776-a753-9672133207c1" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "ebe85c06-b875-4d04-968d-7cc03e876fdc", "10d461b8-f612-45ce-8fbb-0770f3dcee0b" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "55c748f6-7cc9-4a54-9ed3-b1093cedbc2a", "0116e8ab-903e-42da-8f39-b423faafc67a" });

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "1",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "2",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "3",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "4",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "5",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "6",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "7",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "8",
                column: "UserId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "9",
                column: "UserId",
                value: null);
        }
    }
}
