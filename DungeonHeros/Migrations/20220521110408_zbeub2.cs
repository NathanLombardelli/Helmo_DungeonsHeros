using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class zbeub2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Teams_AspNetUsers_UserId1",
                table: "Teams");

            migrationBuilder.DropIndex(
                name: "IX_Teams_UserId1",
                table: "Teams");

            migrationBuilder.DropColumn(
                name: "UserId1",
                table: "Teams");

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Teams",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

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

            migrationBuilder.CreateIndex(
                name: "IX_Teams_UserId",
                table: "Teams",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Teams_AspNetUsers_UserId",
                table: "Teams",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Teams_AspNetUsers_UserId",
                table: "Teams");

            migrationBuilder.DropIndex(
                name: "IX_Teams_UserId",
                table: "Teams");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Teams");

            migrationBuilder.AddColumn<string>(
                name: "UserId1",
                table: "Teams",
                type: "nvarchar(450)",
                nullable: true);

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

            migrationBuilder.CreateIndex(
                name: "IX_Teams_UserId1",
                table: "Teams",
                column: "UserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Teams_AspNetUsers_UserId1",
                table: "Teams",
                column: "UserId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
