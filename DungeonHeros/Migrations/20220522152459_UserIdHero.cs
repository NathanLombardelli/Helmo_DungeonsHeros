using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class UserIdHero : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NomHero = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Dungeon",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Level = table.Column<int>(type: "int", nullable: false),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dungeon", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "DungeonMonstre",
                columns: table => new
                {
                    DungeonsId = table.Column<int>(type: "int", nullable: false),
                    MonstresNom = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    NbrMonstre = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DungeonMonstre", x => new { x.DungeonsId, x.MonstresNom });
                });

            migrationBuilder.CreateTable(
                name: "Hero",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Race = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Classe = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nom = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: false),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: false, defaultValue: "Placeholder_hero.jpg"),
                    Lvl = table.Column<double>(type: "float", nullable: false),
                    Force = table.Column<int>(type: "int", maxLength: 10, nullable: false),
                    Endurance = table.Column<int>(type: "int", maxLength: 10, nullable: false),
                    UserID = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hero", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "HeroTeam",
                columns: table => new
                {
                    TeamsId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    HeroesId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HeroTeam", x => new { x.HeroesId, x.TeamsId });
                });

            migrationBuilder.CreateTable(
                name: "Monster",
                columns: table => new
                {
                    Nom = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Race = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Avatar = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Force = table.Column<int>(type: "int", nullable: false),
                    Endurance = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Monster", x => x.Nom);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Teams",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Score = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teams", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Teams_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "fab4fac1-c546-41de-aebc-a14da6895711", "1", "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "DateOfBirth", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NomHero", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[,]
                {
                    { "2", 0, "38dec4aa-05b9-4eb9-92cb-cbe6d9aa8bed", new DateTime(2000, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "ghostkiller598r@gmail.com", false, false, null, "Ghostkiller", "GHOSTKILLER598R@GMAIL.COM", "GHOSTKILLER", "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", null, false, "45d2c577-bf43-48ca-925f-29f8f15bf908", false, "Ghostkiller" },
                    { "3", 0, "f4c993f8-2a47-4c2c-9162-f7e8ee17ac61", new DateTime(2000, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "nathanlombardelli@hotmail.com", false, false, null, "Ghost", "NATHANLOMBARDELLI@HOTMAIL.COM", "GHOST", "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", null, false, "730a412b-d7f1-46cf-b501-5f57966bbd56", false, "Ghost" },
                    { "4", 0, "f7e6c385-d233-4c32-95cd-a5bdc14e2bf5", new DateTime(1980, 2, 22, 0, 0, 0, 0, DateTimeKind.Unspecified), "fabriceetverodehous@hotmail.com", false, false, null, "LOU", "FABRICEETVERODEHOUS@HOTMAIL.COM", "LOU", "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", null, false, "fafc7839-216d-40f3-b551-c9d637f61c4c", false, "LOU" },
                    { "5", 0, "b342b938-d450-4606-8f36-c657611c5013", new DateTime(1982, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "dejardinveronique.b159@hotmail.com", false, false, null, "Icare", "DEJARDINVERONIQUE.B159@HOTMAIL.COM", "ICARE", "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", null, false, "f4fdbb37-2bc5-405d-b252-5d73e3786aed", false, "Icare" },
                    { "b74ddd14-6340-4840-95c2-db12554843e5", 0, "52f6182b-88cc-4637-92f8-a2a1595c14af", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "admin@hotmail.com", false, false, null, "admin", "ADMIN@HOTMAIL.COM", "ADMIN", "AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw==", null, false, "ce33e574-9275-4c40-bfa5-96caf0932235", false, "admin" }
                });

            migrationBuilder.InsertData(
                table: "Dungeon",
                columns: new[] { "Id", "Image", "Level", "Name" },
                values: new object[,]
                {
                    { 1, "/Images/cover.jpg", 0, "Les Terres Brules" },
                    { 2, "/Images/IceDJ.jpg", 0, "Cours du hibou" },
                    { 3, "/Images/Desert.jpg", 0, "Temple de hrakas" },
                    { 4, "/Images/Forest.jpg", 0, "Foret celeste" }
                });

            migrationBuilder.InsertData(
                table: "DungeonMonstre",
                columns: new[] { "DungeonsId", "MonstresNom", "NbrMonstre" },
                values: new object[,]
                {
                    { 1, "Golem d’os", 1 },
                    { 1, "Kobold", 5 },
                    { 1, "Ogre", 2 },
                    { 1, "Serwaul", 1 },
                    { 2, "Efrit", 2 },
                    { 2, "Fafnir", 1 },
                    { 2, "Hydre", 1 },
                    { 2, "Vouivre", 2 },
                    { 3, "Dark Lord", 1 },
                    { 3, "Serwaul", 5 },
                    { 4, "Araignée", 2 },
                    { 4, "Chauve - Souris", 2 },
                    { 4, "Loup Geant", 1 }
                });

            migrationBuilder.InsertData(
                table: "Hero",
                columns: new[] { "Id", "Classe", "Endurance", "Force", "Image", "Lvl", "Nom", "Race", "UserID" },
                values: new object[,]
                {
                    { "1", "Magicien", 5, 2, "/Images/nainVoleur.jpg", 5.0, "Torain", "Nain", "2" },
                    { "2", "Guerrier", 2, 5, "/Images/orcGuerrier.jpg", 3.0, "Gurldac", "Orc", "2" },
                    { "3", "Archer", 4, 3, "/Images/elfeArcher.jpg", 2.0, "Oldin", "Elf", "2" },
                    { "4", "Voleur", 6, 1, "/Images/humainSorcier.jpg", 5.0, "Didier", "Humain", "2" },
                    { "5", "Voleur", 2, 4, "/Images/nainVoleur.jpg", 3.0, "Gibli", "Nain", "3" },
                    { "6", "Archer", 1, 6, "/Images/orcGuerrier.jpg", 4.5, "Gorduc", "Orc", "3" },
                    { "7", "Guerrier", 3, 2, "/Images/elfeArcher.jpg", 5.0, "Aldin", "Elf", "4" }
                });

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

            migrationBuilder.InsertData(
                table: "Monster",
                columns: new[] { "Nom", "Avatar", "Endurance", "Force", "Race" },
                values: new object[,]
                {
                    { "Araignée", "/Images/Monstre/spider.png", 2, 2, "Animal" },
                    { "Chauve - Souris", "/Images/Monstre/bat.png", 2, 1, "Animal" },
                    { "Dark Lord", "/Images/Monstre/DarkLord.png", 20, 20, "Démon" },
                    { "Efrit", "/Images/Monstre/efrit.png", 4, 4, "Monstre" },
                    { "Fafnir", "/Images/Monstre/Fafnir.png", 7, 9, "Dragon" }
                });

            migrationBuilder.InsertData(
                table: "Monster",
                columns: new[] { "Nom", "Avatar", "Endurance", "Force", "Race" },
                values: new object[,]
                {
                    { "Golem d’os", "/Images/Monstre/Bone_Golem.jpg", 3, 5, "Monstre" },
                    { "Grougaloragran", "/Images/Monstre/grougaloragran.png", 12, 4, "Dragon" },
                    { "Hydre", "/Images/Monstre/hydra.png", 11, 5, "Monstre" },
                    { "Kobold", "/Images/Monstre/kobold.png", 4, 2, "Monstre" },
                    { "Loup Geant", "/Images/Monstre/wolf.png", 3, 4, "Animal" },
                    { "Ogre", "/Images/Monstre/ogre.png", 3, 1, "Monstre" },
                    { "Serwaul", "/Images/Monstre/serwaul.png", 1, 7, "Démon" },
                    { "Vouivre", "/Images/Monstre/wyvern.png", 15, 10, "Dragon" }
                });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "fab4fac1-c546-41de-aebc-a14da6895711", "b74ddd14-6340-4840-95c2-db12554843e5" });

            migrationBuilder.InsertData(
                table: "Teams",
                columns: new[] { "Id", "Score", "UserId" },
                values: new object[,]
                {
                    { "1", 0, "5" },
                    { "2", 15, "5" },
                    { "3", 10, "5" },
                    { "4", 10, "5" },
                    { "5", 5, "5" },
                    { "6", 20, "5" },
                    { "7", 45, "2" },
                    { "8", 25, "4" },
                    { "9", 30, "3" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Teams_UserId",
                table: "Teams",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "Dungeon");

            migrationBuilder.DropTable(
                name: "DungeonMonstre");

            migrationBuilder.DropTable(
                name: "Hero");

            migrationBuilder.DropTable(
                name: "HeroTeam");

            migrationBuilder.DropTable(
                name: "Monster");

            migrationBuilder.DropTable(
                name: "Teams");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");
        }
    }
}
