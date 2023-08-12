using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class zbeub : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Teams_AspNetUsers_UserId",
                table: "Teams");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Teams",
                newName: "UserId1");

            migrationBuilder.RenameIndex(
                name: "IX_Teams_UserId",
                table: "Teams",
                newName: "IX_Teams_UserId1");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "00b58f01-1c52-4961-9aac-a0209f63ac9e", "9ff461ea-6f05-48bb-ba9b-14e266757025" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "16fc0922-f99f-433c-914f-ed25eae75c7f", "44b9ba06-c4bb-457e-bac8-e7daae102ca2" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "b63b218e-224f-475e-90f7-6a88cbd26418", "50a071da-af95-4d76-a4ce-cfbfb3449747" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "005ce9ae-a83d-4598-bfdc-14df32ae6133", "1c9d3321-c8bf-43cf-9ace-b1a6647b7bac" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "890a6d8b-b455-483d-a031-96480837d15a", "cb2acd60-68d8-47cd-97ff-f1441e386f4e" });

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "1",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "2",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "3",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "4",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "5",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "6",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "7",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "8",
                column: "UserId1",
                value: null);

            migrationBuilder.UpdateData(
                table: "Teams",
                keyColumn: "Id",
                keyValue: "9",
                column: "UserId1",
                value: null);

            migrationBuilder.AddForeignKey(
                name: "FK_Teams_AspNetUsers_UserId1",
                table: "Teams",
                column: "UserId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Teams_AspNetUsers_UserId1",
                table: "Teams");

            migrationBuilder.RenameColumn(
                name: "UserId1",
                table: "Teams",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_Teams_UserId1",
                table: "Teams",
                newName: "IX_Teams_UserId");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Teams_AspNetUsers_UserId",
                table: "Teams",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
