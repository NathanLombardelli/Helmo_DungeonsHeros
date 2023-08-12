using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class Admin : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "029ab6f3-ad04-44c5-b681-68a47c20e42a", "fec2b6df-9c71-4c8b-9550-eb726488bbe1" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "b6d666c2-2c11-4812-b71d-d006cac73068", "8eb0a70d-2a96-4fe5-bda1-e86e66ccd13f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "06edc9dc-e6be-404c-b76b-1f3ea33eec65", "bdfd3798-3306-466c-aa6f-5ab164a6ec0a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "9b83cf13-944a-4cb0-a5f1-3ddb7f6dae66", "2d88e0dd-3df9-46a0-aa08-fe90668b21b8" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "DateOfBirth", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NomHero", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "b74ddd14-6340-4840-95c2-db12554843e5", 0, "039f8768-249c-4c8c-9ae2-d41621dfa4f4", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "admin@hotmail.com", false, false, null, "admin", "ADMIN@HOTMAIL.COM", "ADMIN", "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", null, false, "faa7fa3d-27f9-44dc-acd4-3e1f525bf03d", false, "admin" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "1a39948f-0a0a-405b-af07-565c72ac77e8", "4c82b8de-9df5-471a-8046-d13c67e0861b" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "c153c4bd-08c1-468d-af6c-0f0672d322d8", "d05018e4-28f9-4036-882d-1daa40d75c4f" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "98237ade-97aa-456b-87df-c126254758eb", "edd8964b-4a02-4306-aada-1d1f55f83381" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "4da1f5bb-251a-4c06-8218-c53de54760b7", "2b066bae-b728-4534-8f40-1cc7ff4a2e8f" });
        }
    }
}
