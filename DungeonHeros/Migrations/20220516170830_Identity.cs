using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DungeonHeros.Migrations
{
    public partial class Identity : Migration
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
                name: "HeroTeam",
                columns: table => new
                {
                    IdTeam = table.Column<int>(type: "int", nullable: false),
                    IdHero = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HeroTeam", x => new { x.IdTeam, x.IdHero });
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
                name: "Teams",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Score = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teams", x => x.Id);
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
                name: "Hero",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Race = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Classe = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nom = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: false),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: false, defaultValue: "Placeholder_hero.jpg"),
                    Force = table.Column<int>(type: "int", maxLength: 10, nullable: false),
                    Endurance = table.Column<int>(type: "int", maxLength: 10, nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hero", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Hero_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "DateOfBirth", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NomHero", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[,]
                {
                    { "1", 0, "b41fd7c7-a59e-40aa-9e4e-edfcc5fbe4f7", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "admin", false, false, null, "admin", null, null, null, null, false, "22c02b82-f84a-4117-99ee-6ede6568e9ac", false, null },
                    { "2", 0, "3996a542-49ab-4ba9-b643-65cdf367f988", new DateTime(2000, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "ghostkiller598r@gmail.com", false, false, null, "Ghostkiller", null, null, null, null, false, "eb0bccb9-4ad6-4d6f-934d-7aa3722b1856", false, null },
                    { "3", 0, "2e135d40-a803-4ae0-8e30-bc00686db892", new DateTime(2000, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "nathanlombardelli@hotmail.com", false, false, null, "Ghost", null, null, null, null, false, "5224f0be-2c1b-48aa-8c63-f74313bb2f61", false, null },
                    { "4", 0, "99e95943-737d-4394-9695-b385bc8469fd", new DateTime(1980, 2, 22, 0, 0, 0, 0, DateTimeKind.Unspecified), "fabriceetverodehous@hotmail.com", false, false, null, "LOU", null, null, null, null, false, "a65afb01-8acf-420f-a41e-2bf2c2983f71", false, null },
                    { "5", 0, "a9759ddf-ef38-45a1-b733-37a13721ffab", new DateTime(1982, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "dejardinveronique.b159@hotmail.com", false, false, null, "Icare", null, null, null, null, false, "1c844161-6be8-430b-ad47-f51c65d7611c", false, null }
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
                table: "HeroTeam",
                columns: new[] { "IdHero", "IdTeam" },
                values: new object[,]
                {
                    { 1, 7 },
                    { 2, 7 },
                    { 3, 7 },
                    { 4, 7 },
                    { 7, 8 },
                    { 5, 9 },
                    { 6, 9 }
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
                    { "Fafnir", "/Images/Monstre/Fafnir.png", 7, 9, "Dragon" },
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
                table: "Teams",
                columns: new[] { "Id", "Score", "UserId" },
                values: new object[,]
                {
                    { 1, 0, "2" },
                    { 2, 15, "1" },
                    { 3, 10, "1" },
                    { 4, 10, "1" },
                    { 5, 5, "2" },
                    { 6, 20, "3" },
                    { 7, 45, "2" },
                    { 8, 25, "3" },
                    { 9, 30, "3" }
                });

            migrationBuilder.InsertData(
                table: "Hero",
                columns: new[] { "Id", "Classe", "Endurance", "Force", "Image", "Nom", "Race", "UserId" },
                values: new object[,]
                {
                    { 1, "Magicien", 5, 2, "/Images/nainVoleur.jpg", "Torain", "Nain", "2" },
                    { 2, "Guerrier", 2, 5, "/Images/orcGuerrier.jpg", "Gurldac", "Orc", "2" },
                    { 3, "Archer", 4, 3, "/Images/elfeArcher.jpg", "Oldin", "Elf", "2" },
                    { 4, "Voleur", 6, 1, "/Images/humainSorcier.jpg", "Didier", "Humain", "2" },
                    { 5, "Voleur", 2, 4, "/Images/nainVoleur.jpg", "Gibli", "Nain", "3" },
                    { 6, "Archer", 1, 6, "/Images/orcGuerrier.jpg", "Gorduc", "Orc", "3" },
                    { 7, "Guerrier", 3, 2, "/Images/elfeArcher.jpg", "Aldin", "Elf", "4" }
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
                name: "IX_Hero_UserId",
                table: "Hero",
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
