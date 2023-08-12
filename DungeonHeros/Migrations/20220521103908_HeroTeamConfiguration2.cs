using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class HeroTeamConfiguration2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.InsertData(
                table: "HeroTeam",
                columns: new[] { "HeroesId", "TeamsId" },
                values: new object[,]
                {
                    { "1", "7" },
                    { "2", "7" },
                    { "3", "7" },
                    { "4", "7" },
                    { "5", "9" },
                    { "6", "9" },
                    { "7", "8" }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "1", "7" });

            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "2", "7" });

            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "3", "7" });

            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "4", "7" });

            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "5", "9" });

            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "6", "9" });

            migrationBuilder.DeleteData(
                table: "HeroTeam",
                keyColumns: new[] { "HeroesId", "TeamsId" },
                keyValues: new object[] { "7", "8" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "95a6afa3-f551-4685-99ea-66cf33f4484e", "c01e5abb-5ff6-4377-aaa2-87130acc2ee8" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "245538c9-67ea-4691-9f85-1330c2aa4448", "8b6d38ac-e638-46e8-99d2-d06fc4b55c6a" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "4",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "47f02ee0-380a-483c-a609-932086ecc2f6", "8635cd42-1864-4147-8300-f01e20d591a9" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "5592cae6-cd39-41ce-8521-21f9fc6884f5", "e4b31287-43ed-41a1-9ab0-32a9c0b64074" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b74ddd14-6340-4840-95c2-db12554843e5",
                columns: new[] { "ConcurrencyStamp", "SecurityStamp" },
                values: new object[] { "1851187d-f5c7-4b66-b104-50c10a89e90f", "5fe9d332-f46f-451d-8069-87053acbfbe2" });
        }
    }
}
