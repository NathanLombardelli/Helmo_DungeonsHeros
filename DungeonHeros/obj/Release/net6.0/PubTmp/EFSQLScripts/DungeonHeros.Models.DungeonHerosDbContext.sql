IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507135014_InitialMigration')
BEGIN
    CREATE TABLE [Teams] (
        [Id] int NOT NULL IDENTITY,
        [Score] int NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507135014_InitialMigration')
BEGIN
    CREATE TABLE [Hero] (
        [Id] int NOT NULL IDENTITY,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(max) NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [TeamId] int NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_Teams_TeamId] FOREIGN KEY ([TeamId]) REFERENCES [Teams] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507135014_InitialMigration')
BEGIN
    CREATE INDEX [IX_Hero_TeamId] ON [Hero] ([TeamId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507135014_InitialMigration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220507135014_InitialMigration', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507140401_NotNullAndSize')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'Race');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Hero] ALTER COLUMN [Race] nvarchar(60) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507140401_NotNullAndSize')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'Nom');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Hero] ALTER COLUMN [Nom] nvarchar(60) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507140401_NotNullAndSize')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'Classe');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Hero] ALTER COLUMN [Classe] nvarchar(60) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507140401_NotNullAndSize')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220507140401_NotNullAndSize', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507160137_enumClassRace')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'Race');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Hero] ALTER COLUMN [Race] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507160137_enumClassRace')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'Classe');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Hero] ALTER COLUMN [Classe] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507160137_enumClassRace')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220507160137_enumClassRace', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507161022_testEnum')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Nom', N'Race', N'TeamId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Nom], [Race], [TeamId])
    VALUES (1, N''Guerrier'', 7, 7, N''Ghost.png'', N''Ghost'', N''Orc'', NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Nom', N'Race', N'TeamId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507161022_testEnum')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220507161022_testEnum', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507163952_DefaultImage')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'Image');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Hero] ADD DEFAULT N'Placeholder_hero.jpg' FOR [Image];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507163952_DefaultImage')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220507163952_DefaultImage', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220507164401_idAutoGenerated')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220507164401_idAutoGenerated', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510064217_HerosTeams')
BEGIN
    ALTER TABLE [Hero] DROP CONSTRAINT [FK_Hero_Teams_TeamId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510064217_HerosTeams')
BEGIN
    DROP INDEX [IX_Hero_TeamId] ON [Hero];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510064217_HerosTeams')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hero]') AND [c].[name] = N'TeamId');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Hero] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Hero] DROP COLUMN [TeamId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510064217_HerosTeams')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220510064217_HerosTeams', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510064639_HerosTeams2')
BEGIN
    CREATE TABLE [HerosTeams] (
        [idHero] int NOT NULL,
        [idTeam] int NOT NULL,
        CONSTRAINT [PK_HerosTeams] PRIMARY KEY ([idHero], [idTeam])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510064639_HerosTeams2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220510064639_HerosTeams2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    EXEC sp_rename N'[HerosTeams].[idTeam]', N'IdTeam', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    EXEC sp_rename N'[HerosTeams].[idHero]', N'IdHero', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    ALTER TABLE [Hero] ADD [UserId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    CREATE TABLE [User] (
        [Id] int NOT NULL IDENTITY,
        [Mail] nvarchar(max) NOT NULL,
        [Password] nvarchar(max) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_User] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    ALTER TABLE [Hero] ADD CONSTRAINT [FK_Hero_User_UserId] FOREIGN KEY ([UserId]) REFERENCES [User] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510070828_DungeonUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220510070828_DungeonUser', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510080232_DungeonMonster')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510080232_DungeonMonster')
BEGIN
    CREATE TABLE [Monstre] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monstre] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510080232_DungeonMonster')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom]),
        CONSTRAINT [FK_DungeonMonstre_Dungeon_DungeonsId] FOREIGN KEY ([DungeonsId]) REFERENCES [Dungeon] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_DungeonMonstre_Monstre_MonstresNom] FOREIGN KEY ([MonstresNom]) REFERENCES [Monstre] ([Nom]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510080232_DungeonMonster')
BEGIN
    CREATE INDEX [IX_DungeonMonstre_MonstresNom] ON [DungeonMonstre] ([MonstresNom]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510080232_DungeonMonster')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220510080232_DungeonMonster', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220510083948_TeamHero')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220510083948_TeamHero', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [DungeonMonstre] DROP CONSTRAINT [FK_DungeonMonstre_Monstre_MonstresNom];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [Hero] DROP CONSTRAINT [FK_Hero_User_UserId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [User] DROP CONSTRAINT [PK_User];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [Monstre] DROP CONSTRAINT [PK_Monstre];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    EXEC sp_rename N'[User]', N'users';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    EXEC sp_rename N'[Monstre]', N'Monster';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [Teams] ADD [UserId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [users] ADD CONSTRAINT [PK_users] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [Monster] ADD CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DateOfBirth', N'Mail', N'NomHero', N'Password') AND [object_id] = OBJECT_ID(N'[users]'))
        SET IDENTITY_INSERT [users] ON;
    EXEC(N'INSERT INTO [users] ([Id], [DateOfBirth], [Mail], [NomHero], [Password])
    VALUES (1, ''0001-01-01T00:00:00.0000000'', N''admin'', N''admin'', N''admin''),
    (2, ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', N''Ghostkiller'', N''qwerty''),
    (3, ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', N''Ghost'', N''qwerty''),
    (4, ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', N''LOU'', N''FLloulou''),
    (5, ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', N''Icare'', N''dejdej'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DateOfBirth', N'Mail', N'NomHero', N'Password') AND [object_id] = OBJECT_ID(N'[users]'))
        SET IDENTITY_INSERT [users] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Endurance] = 5, [Force] = 2, [Image] = N''.../Images/nainVoleur.jpg'', [Nom] = N''Torain'', [UserId] = 2
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Nom], [Race], [UserId])
    VALUES (2, N''Archer'', 2, 5, N''.../Images/orcGuerrier.jpg'', N''Gurldac'', N''Elf'', 2),
    (3, N''Voleur'', 4, 3, N''.../Images/elfeArcher.jpg'', N''Oldin'', N''Humain'', 2),
    (4, N''Guerrier'', 6, 1, N''.../Images/humainSorcier.jpg'', N''Didier'', N''4'', 2),
    (5, N''4'', 2, 4, N''.../Images/nainVoleur.jpg'', N''Gibli'', N''Orc'', 3),
    (6, N''Voleur'', 1, 6, N''.../Images/orcGuerrier.jpg'', N''Gorduc'', N''Elf'', 3),
    (7, N''Archer'', 3, 2, N''.../Images/elfeArcher.jpg'', N''aldin'', N''Humain'', 4)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (1, 0, 2),
    (2, 15, 1),
    (3, 10, 1),
    (4, 10, 1),
    (5, 5, 2),
    (6, 20, 3),
    (7, 45, 2),
    (8, 25, 3),
    (9, 30, 3)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [DungeonMonstre] ADD CONSTRAINT [FK_DungeonMonstre_Monster_MonstresNom] FOREIGN KEY ([MonstresNom]) REFERENCES [Monster] ([Nom]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [Hero] ADD CONSTRAINT [FK_Hero_users_UserId] FOREIGN KEY ([UserId]) REFERENCES [users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    ALTER TABLE [Teams] ADD CONSTRAINT [FK_Teams_users_UserId] FOREIGN KEY ([UserId]) REFERENCES [users] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511141006_monster')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220511141006_monster', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511144808_DungeonConfiguration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''.../Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''.../Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''.../Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''.../Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511144808_DungeonConfiguration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''.../Images/Monstre/spider.jpg'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''.../Images/Monstre/bat.jpg'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''.../Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''.../Images/Monstre/efrit.jpg'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''.../Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''.../Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''.../Images/Monstre/grougaloragran.jpg'', 12, 4, N''Dragon''),
    (N''Hydre'', N''.../Images/Monstre/hydra.jpg'', 11, 5, N''Monstre''),
    (N''Kobold'', N''.../Images/Monstre/kobold.jpg'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''.../Images/Monstre/wolf.jpg'', 3, 4, N''Animal''),
    (N''Ogre'', N''.../Images/Monstre/ogre.jpg'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''.../Images/Monstre/serwaul.jpeg'', 1, 7, N''Démon''),
    (N''Vouivre'', N''.../Images/Monstre/wyvern.jpg'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511144808_DungeonConfiguration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220511144808_DungeonConfiguration', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    ALTER TABLE [DungeonMonstre] DROP CONSTRAINT [FK_DungeonMonstre_Dungeon_DungeonsId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    ALTER TABLE [DungeonMonstre] DROP CONSTRAINT [FK_DungeonMonstre_Monster_MonstresNom];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    DROP INDEX [IX_DungeonMonstre_MonstresNom] ON [DungeonMonstre];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    ALTER TABLE [DungeonMonstre] ADD [NbrMonstre] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Magicien'', [Race] = N''Nain''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Guerrier'', [Race] = N''Orc''
    WHERE [Id] = 2;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Archer'', [Race] = N''Elf''
    WHERE [Id] = 3;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Magicien'', [Race] = N''Humain''
    WHERE [Id] = 4;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Voleur'', [Race] = N''Nain''
    WHERE [Id] = 5;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Archer'', [Race] = N''Orc''
    WHERE [Id] = 6;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Classe] = N''Guerrier'', [Nom] = N''Aldin'', [Race] = N''Elf''
    WHERE [Id] = 7;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511160131_DungeonMonstre')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220511160131_DungeonMonstre', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511181129_debug')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220511181129_debug', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511181423_HeroTeam')
BEGIN
    CREATE TABLE [HeroTeam] (
        [IdHero] int NOT NULL,
        [IdTeam] int NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([IdTeam], [IdHero])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511181423_HeroTeam')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([IdHero], [IdTeam])
    VALUES (1, 7),
    (2, 7),
    (3, 7),
    (4, 7),
    (7, 8),
    (5, 9),
    (6, 9)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511181423_HeroTeam')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220511181423_HeroTeam', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512142347_userInTeam')
BEGIN
    ALTER TABLE [Teams] DROP CONSTRAINT [FK_Teams_users_UserId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512142347_userInTeam')
BEGIN
    DROP INDEX [IX_Teams_UserId] ON [Teams];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512142347_userInTeam')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220512142347_userInTeam', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/nainVoleur.jpg''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/orcGuerrier.jpg''
    WHERE [Id] = 2;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/elfeArcher.jpg''
    WHERE [Id] = 3;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/humainSorcier.jpg''
    WHERE [Id] = 4;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/nainVoleur.jpg''
    WHERE [Id] = 5;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/orcGuerrier.jpg''
    WHERE [Id] = 6;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Image] = N''/Images/elfeArcher.jpg''
    WHERE [Id] = 7;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/spider.jpg''
    WHERE [Nom] = N''Araignée'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/bat.jpg''
    WHERE [Nom] = N''Chauve - Souris'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/DarkLord.png''
    WHERE [Nom] = N''Dark Lord'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/efrit.jpg''
    WHERE [Nom] = N''Efrit'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/Fafnir.png''
    WHERE [Nom] = N''Fafnir'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/Bone_Golem.jpg''
    WHERE [Nom] = N''Golem d’os'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/grougaloragran.jpg''
    WHERE [Nom] = N''Grougaloragran'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/hydra.jpg''
    WHERE [Nom] = N''Hydre'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/kobold.jpg''
    WHERE [Nom] = N''Kobold'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/wolf.jpg''
    WHERE [Nom] = N''Loup Geant'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/ogre.jpg''
    WHERE [Nom] = N''Ogre'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/serwaul.jpeg''
    WHERE [Nom] = N''Serwaul'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/wyvern.jpg''
    WHERE [Nom] = N''Vouivre'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220512144932_erorImgString')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220512144932_erorImgString', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513120418_errorImgDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Image] = N''/Images/cover.jpg''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513120418_errorImgDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Image] = N''/Images/IceDJ.jpg''
    WHERE [Id] = 2;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513120418_errorImgDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Image] = N''/Images/Desert.jpg''
    WHERE [Id] = 3;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513120418_errorImgDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Image] = N''/Images/Forest.jpg''
    WHERE [Id] = 4;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513120418_errorImgDj')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220513120418_errorImgDj', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/spider.png''
    WHERE [Nom] = N''Araignée'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/bat.png''
    WHERE [Nom] = N''Chauve - Souris'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/efrit.png''
    WHERE [Nom] = N''Efrit'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/grougaloragran.png''
    WHERE [Nom] = N''Grougaloragran'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/hydra.png''
    WHERE [Nom] = N''Hydre'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/kobold.png''
    WHERE [Nom] = N''Kobold'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/wolf.png''
    WHERE [Nom] = N''Loup Geant'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/ogre.png''
    WHERE [Nom] = N''Ogre'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/serwaul.png''
    WHERE [Nom] = N''Serwaul'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    EXEC(N'UPDATE [Monster] SET [Avatar] = N''/Images/Monstre/wyvern.png''
    WHERE [Nom] = N''Vouivre'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513135634_transImgMonstre')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220513135634_transImgMonstre', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [HeroTeam] (
        [IdTeam] int NOT NULL,
        [IdHero] int NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([IdTeam], [IdHero])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [Teams] (
        [Id] int NOT NULL IDENTITY,
        [Score] int NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE TABLE [Hero] (
        [Id] int NOT NULL IDENTITY,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''1'', 0, N''b41fd7c7-a59e-40aa-9e4e-edfcc5fbe4f7'', ''0001-01-01T00:00:00.0000000'', N''admin'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', NULL, NULL, NULL, NULL, CAST(0 AS bit), N''22c02b82-f84a-4117-99ee-6ede6568e9ac'', CAST(0 AS bit), NULL),
    (N''2'', 0, N''3996a542-49ab-4ba9-b643-65cdf367f988'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', NULL, NULL, NULL, NULL, CAST(0 AS bit), N''eb0bccb9-4ad6-4d6f-934d-7aa3722b1856'', CAST(0 AS bit), NULL),
    (N''3'', 0, N''2e135d40-a803-4ae0-8e30-bc00686db892'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', NULL, NULL, NULL, NULL, CAST(0 AS bit), N''5224f0be-2c1b-48aa-8c63-f74313bb2f61'', CAST(0 AS bit), NULL),
    (N''4'', 0, N''99e95943-737d-4394-9695-b385bc8469fd'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', NULL, NULL, NULL, NULL, CAST(0 AS bit), N''a65afb01-8acf-420f-a41e-2bf2c2983f71'', CAST(0 AS bit), NULL),
    (N''5'', 0, N''a9759ddf-ef38-45a1-b733-37a13721ffab'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', NULL, NULL, NULL, NULL, CAST(0 AS bit), N''1c844161-6be8-430b-ad47-f51c65d7611c'', CAST(0 AS bit), NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([IdHero], [IdTeam])
    VALUES (1, 7),
    (2, 7),
    (3, 7),
    (4, 7),
    (7, 8),
    (5, 9),
    (6, 9)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon''),
    (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (1, 0, N''2''),
    (2, 15, N''1''),
    (3, 10, N''1''),
    (4, 10, N''1''),
    (5, 5, N''2''),
    (6, 20, N''3''),
    (7, 45, N''2''),
    (8, 25, N''3''),
    (9, 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Nom], [Race], [UserId])
    VALUES (1, N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', N''Torain'', N''Nain'', N''2''),
    (2, N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', N''Gurldac'', N''Orc'', N''2''),
    (3, N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', N''Oldin'', N''Elf'', N''2''),
    (4, N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', N''Didier'', N''Humain'', N''2''),
    (5, N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', N''Gibli'', N''Nain'', N''3''),
    (6, N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', N''Gorduc'', N''Orc'', N''3''),
    (7, N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516170830_Identity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220516170830_Identity', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516181359_UserName')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''a362e03d-ea61-46f9-b6af-0cd906e2e0c4'', [SecurityStamp] = N''e4583bae-1a60-4f62-925d-ed6efeea11f2'', [UserName] = N''admin''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516181359_UserName')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''9fab3981-2054-41cb-8cc7-023728b98ea6'', [SecurityStamp] = N''5850321a-537b-4a42-aafd-e4c9521647a9'', [UserName] = N''Ghostkiller''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516181359_UserName')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''db788135-60ef-4efd-8663-d04c5c82348c'', [SecurityStamp] = N''250f53d0-bb5a-4ddc-b01c-cc0319337803'', [UserName] = N''Ghost''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516181359_UserName')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''bd8bc52e-9cd6-49c3-a85f-0e5addda782b'', [SecurityStamp] = N''2799fc23-caa0-471f-8313-d8d6ce73006b'', [UserName] = N''LOU''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516181359_UserName')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''606ceea4-20af-4792-b1bd-d3f7dea5fc13'', [SecurityStamp] = N''c0ee5d40-f56f-4e42-9319-636d574b20e0'', [UserName] = N''Icare''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516181359_UserName')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220516181359_UserName', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517062927_IdentityUser')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''cb273942-8183-49a6-b947-22ade2620a43'', [SecurityStamp] = N''5e0e1c86-c351-4c0d-8e77-6a49939e858f''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517062927_IdentityUser')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''001e41fb-559b-463e-8260-6bb3e0debc08'', [SecurityStamp] = N''2ed82c1d-4218-4ee1-b17a-88d19f22adec''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517062927_IdentityUser')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''c5f7f81f-9c11-4108-bf4c-f2a7fe70053b'', [SecurityStamp] = N''a43534e7-dc01-4009-9c78-85c9e3175f2a''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517062927_IdentityUser')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''4f0c379f-8238-475f-aeab-ab28ee1e7ad9'', [SecurityStamp] = N''5cd83424-79d9-424b-a48e-1a561123e51a''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517062927_IdentityUser')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''73228c19-b109-40db-9357-6478a99b4596'', [SecurityStamp] = N''79fd8c91-d387-4911-92c5-edf5a3ae25af''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517062927_IdentityUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220517062927_IdentityUser', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    ALTER TABLE [Hero] ADD [Lvl] float NOT NULL DEFAULT 0.0E0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''0fcc7844-f287-46e0-b4b3-3ba77e436e58'', [SecurityStamp] = N''c0f4e305-6d8e-4a55-bcb3-f100c7644fda''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''00a56257-95d0-456f-942c-fba8245b1662'', [SecurityStamp] = N''ebec94cc-ecf1-4fd1-b2a3-8174ff0a2f15''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''3ccded1b-26a7-43b3-9e46-12e9e242b445'', [SecurityStamp] = N''d8f5f944-d139-464a-9a64-4ddf947d945e''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''a201c5f6-ff43-4ffa-8ae7-6a35cb321a99'', [SecurityStamp] = N''6d18f4cb-a6d2-4aae-83b1-7fe4adce60b6''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''64ffc414-1fdf-468e-bd11-9c411e7160aa'', [SecurityStamp] = N''fadcab0c-8172-49f3-b5fa-11b65d7baa69''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 5.0E0
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 3.0E0
    WHERE [Id] = 2;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 2.0E0
    WHERE [Id] = 3;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 5.0E0
    WHERE [Id] = 4;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 3.0E0
    WHERE [Id] = 5;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 4.5E0
    WHERE [Id] = 6;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    EXEC(N'UPDATE [Hero] SET [Lvl] = 5.0E0
    WHERE [Id] = 7;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220517090932_LevelHero')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220517090932_LevelHero', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519143816_Register')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''397a6279-9460-4f62-9fe1-e9263b5a316f'', [SecurityStamp] = N''4d7ffc8a-bc90-487d-8123-68c183a328c5''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519143816_Register')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''c5003f01-f239-4fdb-bc59-fca18d936b90'', [SecurityStamp] = N''55d98ba1-e30e-41cc-bb26-2f151b7ea56c''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519143816_Register')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''3f099541-5e21-48f1-88c3-9965fb947066'', [SecurityStamp] = N''eb3fca14-7416-44b7-8c69-9f07f7d2b910''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519143816_Register')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''7ca07714-14fc-440b-9379-c75d8360e813'', [SecurityStamp] = N''d1ac623e-b70e-4219-9442-333dab8caed4''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519143816_Register')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''b9500854-2eb7-498f-a5b0-5b8af98898cc'', [SecurityStamp] = N''ed2155d0-6616-488e-b289-4e63cffc7aa0''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519143816_Register')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519143816_Register', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519174709_Roles')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''c80dbcc3-9258-4509-a444-71ba70bbedd9'', [SecurityStamp] = N''78e9b0c5-7f42-4333-90ee-744c5eb866c4''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519174709_Roles')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''269ab791-1f43-46d8-a76d-d39049febf80'', [SecurityStamp] = N''68226bdc-00ac-48c7-b0dd-f5e157ac7da2''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519174709_Roles')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''d087c347-c88d-43e4-bd52-81f901477177'', [SecurityStamp] = N''58b9fb6e-eff7-4c72-ba84-50b3a3fe04ad''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519174709_Roles')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''c12f825f-95a6-48a4-8113-162248605926'', [SecurityStamp] = N''9c6499e8-1bf1-4aa4-b587-5f07a5d7c1b5''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519174709_Roles')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''22f8892d-a92e-4e20-92d9-00ba2af0ade2'', [SecurityStamp] = N''04fa5393-9161-4b75-8e71-036213193b9a''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519174709_Roles')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519174709_Roles', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519175239_Role2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''25011ef7-bd3a-4a01-a155-274fb12bb117'', [SecurityStamp] = N''01d22395-1e3c-48ad-8d56-3f236632258a''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519175239_Role2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''3599d339-b194-4ef5-ab21-08d1450f0759'', [SecurityStamp] = N''ab87a78f-5fb3-408b-b437-bb7d71704819''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519175239_Role2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''d7228cbd-00ec-4e8e-9efc-fa2326297f85'', [SecurityStamp] = N''785be137-ee57-4886-91b4-40eb9994f7d2''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519175239_Role2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''61f0a2b7-1c32-4a4a-91fd-8b0399364f44'', [SecurityStamp] = N''4d749860-d7b8-44f6-88ff-5ad4ed7a9b0f''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519175239_Role2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''83ab4aac-323c-44fe-92c4-db10d8ec7bea'', [SecurityStamp] = N''6dca74ae-40a4-42bc-98d0-288af7d790ff''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519175239_Role2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519175239_Role2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [HeroTeam] (
        [IdTeam] int NOT NULL,
        [IdHero] int NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([IdTeam], [IdHero])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [Teams] (
        [Id] int NOT NULL IDENTITY,
        [Score] int NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE TABLE [Hero] (
        [Id] int NOT NULL IDENTITY,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''Admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''94a7c5cd-4b11-4750-86d1-b92c03be91a9'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', NULL, NULL, N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''1bfcfaa4-4d76-4bb7-b66a-05d074a28309'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''63f8e289-d302-49ef-8229-bb5b6ac2b18f'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', NULL, NULL, N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''1b4178d4-037c-4802-bcfb-e1e1d2a5dc2e'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''67a86722-8f2d-49a5-ada4-6deeaceb2d7f'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', NULL, NULL, N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''88e6a9e2-fde9-4bbb-a26b-2712c6f98544'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''ea31ce84-8a78-4539-b1f1-d70c757e5880'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', NULL, NULL, N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''27c10941-25f1-48e4-a259-42eb735492a3'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''3cfc03aa-64cc-496a-8075-279b8cfe5ebe'', ''0001-01-01T00:00:00.0000000'', N''admin'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', NULL, NULL, N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''043c832d-1856-470b-80ff-bc8fe16bd486'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([IdHero], [IdTeam])
    VALUES (1, 7),
    (2, 7),
    (3, 7),
    (4, 7),
    (7, 8),
    (5, 9),
    (6, 9)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (1, 0, N''2''),
    (2, 15, N''1''),
    (3, 10, N''1''),
    (4, 10, N''1''),
    (5, 5, N''2''),
    (6, 20, N''3''),
    (7, 45, N''2''),
    (8, 25, N''3''),
    (9, 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserId])
    VALUES (1, N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (2, N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (3, N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (4, N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (5, N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (6, N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (7, N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519185809_User')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519185809_User', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519201401_Normalized')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''1a39948f-0a0a-405b-af07-565c72ac77e8'', [NormalizedEmail] = N''GHOSTKILLER598R@GMAIL.COM'', [NormalizedUserName] = N''GHOSTKILLER'', [SecurityStamp] = N''4c82b8de-9df5-471a-8046-d13c67e0861b''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519201401_Normalized')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''c153c4bd-08c1-468d-af6c-0f0672d322d8'', [NormalizedEmail] = N''NATHANLOMBARDELLI@HOTMAIL.COM'', [NormalizedUserName] = N''GHOST'', [SecurityStamp] = N''d05018e4-28f9-4036-882d-1daa40d75c4f''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519201401_Normalized')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''98237ade-97aa-456b-87df-c126254758eb'', [NormalizedEmail] = N''FABRICEETVERODEHOUS@HOTMAIL.COM'', [NormalizedUserName] = N''LOU'', [SecurityStamp] = N''edd8964b-4a02-4306-aada-1d1f55f83381''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519201401_Normalized')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''4da1f5bb-251a-4c06-8218-c53de54760b7'', [NormalizedEmail] = N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', [NormalizedUserName] = N''ICARE'', [SecurityStamp] = N''2b066bae-b728-4534-8f40-1cc7ff4a2e8f''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519201401_Normalized')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''ca39eebc-111a-4053-abc1-40d0a24f9009'', [Email] = N''admin@hotmail.com'', [NormalizedEmail] = N''ADMIN@HOTMAIL.COM'', [NormalizedUserName] = N''ADMIN'', [SecurityStamp] = N''b1e55a5d-1938-42c1-8f78-8d385f0b9118''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519201401_Normalized')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519201401_Normalized', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203334_Admin')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''029ab6f3-ad04-44c5-b681-68a47c20e42a'', [SecurityStamp] = N''fec2b6df-9c71-4c8b-9550-eb726488bbe1''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203334_Admin')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''b6d666c2-2c11-4812-b71d-d006cac73068'', [SecurityStamp] = N''8eb0a70d-2a96-4fe5-bda1-e86e66ccd13f''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203334_Admin')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''06edc9dc-e6be-404c-b76b-1f3ea33eec65'', [SecurityStamp] = N''bdfd3798-3306-466c-aa6f-5ab164a6ec0a''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203334_Admin')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''9b83cf13-944a-4cb0-a5f1-3ddb7f6dae66'', [SecurityStamp] = N''2d88e0dd-3df9-46a0-aa08-fe90668b21b8''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203334_Admin')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''039f8768-249c-4c8c-9ae2-d41621dfa4f4'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''faa7fa3d-27f9-44dc-acd4-3e1f525bf03d'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203334_Admin')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519203334_Admin', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''b4a7c0ff-8376-45ac-b275-fdc46daeb85b'', [SecurityStamp] = N''3ed7e422-439b-4142-982f-f8b20561b96b''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''2f57139d-8db7-4386-975f-832322963f5c'', [SecurityStamp] = N''5ea72779-0b28-4b16-a367-a367ef20be80''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''ad993eff-1842-4edb-b97d-f7949dea7f6c'', [SecurityStamp] = N''2026a6f1-e209-4e3a-b5b5-6b91ef5767ba''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''72002d0e-aef3-47b2-816d-06f1c265239c'', [SecurityStamp] = N''b8109846-3258-447c-b8b8-c8846ad2d7fd''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''f76b3833-1e99-405f-9aa3-49a47ec0cad3'', [SecurityStamp] = N''edc95a7d-2984-4739-97c2-553e18007b0c''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220519203919_UserRole')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220519203919_UserRole', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [HeroTeam] (
        [IdTeam] int NOT NULL,
        [IdHero] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([IdTeam], [IdHero])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [Teams] (
        [Id] int NOT NULL IDENTITY,
        [Score] int NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''49f084d5-e519-4b56-819b-efe482721e66'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''fb660a39-2b20-4f3d-af5a-fc31d5287573'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''8fb138eb-a495-42d0-9bce-22568491a197'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''eef64b36-347f-411a-9e89-c844818b6e49'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''e03d49f0-2124-48af-8407-816f3a878903'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''6fbaa87f-1280-4c21-bae1-7d0853480dc4'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''056c8750-6738-401c-a5d4-e751f0e3e6cd'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''42f224e8-98f5-429c-aa3e-ef509707bb8b'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''33ef0125-640a-4570-a4de-388aca3afcf4'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''9cea13cc-1393-48a8-a15b-3ede99756c1f'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([IdHero], [IdTeam])
    VALUES (N''1'', 7),
    (N''2'', 7),
    (N''3'', 7),
    (N''4'', 7),
    (N''7'', 8),
    (N''5'', 9),
    (N''6'', 9)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (1, 0, N''2''),
    (2, 15, N''1''),
    (3, 10, N''1''),
    (4, 10, N''1''),
    (5, 5, N''2''),
    (6, 20, N''3''),
    (7, 45, N''2''),
    (8, 25, N''3''),
    (9, 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserId])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520171009_idHeroString')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220520171009_idHeroString', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [HeroTeam] (
        [IdTeam] nvarchar(450) NOT NULL,
        [IdHero] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([IdTeam], [IdHero])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''44cabddc-8df7-4fbe-95db-ae4afa4ec15e'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''9c559de9-ece8-4359-9d9e-ef2c49ab9d90'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''0da4da14-b3ed-4c29-bd66-b39b9a16862c'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''6b418d70-7433-43a6-8232-c2fca56491b9'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''fa766105-55fc-436d-bcdc-67b999af9263'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''9c01e9d4-f056-4c49-9f16-9d475cf83fdc'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''c72a7b4c-c3ea-4c1c-8d1c-d0ad8dc63ee9'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''08c0ee91-30be-44b6-ae43-380e1e938eab'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''cb2ee040-c097-4335-b8c1-199968754400'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''03cf469c-44fb-48f1-b765-28e8eaba00fe'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([IdHero], [IdTeam])
    VALUES (N''1'', N''7''),
    (N''2'', N''7''),
    (N''3'', N''7''),
    (N''4'', N''7''),
    (N''7'', N''8''),
    (N''5'', N''9''),
    (N''6'', N''9'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, N''2''),
    (N''2'', 15, N''1''),
    (N''3'', 10, N''1''),
    (N''4'', 10, N''1''),
    (N''5'', 5, N''2''),
    (N''6'', 20, N''3''),
    (N''7'', 45, N''2''),
    (N''8'', 25, N''3''),
    (N''9'', 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserId])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520175345_TeamIdString')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220520175345_TeamIdString', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [HeroTeam] (
        [IdTeam] nvarchar(450) NOT NULL,
        [IdHero] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([IdTeam], [IdHero])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''cdeb6864-ca38-436e-8c79-b95e9b9dae8b'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''7d155c87-5f18-42d4-9773-e55b22d0ac21'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''4a2a3109-60d6-4c0d-8758-0d17d9a6fc73'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''4a135445-ac57-491d-86e1-2fd44df944e7'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''e7baeea8-c5e9-4ab7-9d68-e9227b1f63b1'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''69e27f4f-332d-44f4-bd10-ee7398269a37'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''c82476d1-5fef-4223-bdd3-a233c151a0e5'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''0d0463fb-b827-4a99-851f-e7186f0d6ba1'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''cfb433aa-5fbb-466a-9709-05d2e4b91946'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''41b94103-bc53-4f13-8768-21e2a133b4d8'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([IdHero], [IdTeam])
    VALUES (N''1'', N''7''),
    (N''2'', N''7''),
    (N''3'', N''7''),
    (N''4'', N''7''),
    (N''7'', N''8''),
    (N''5'', N''9''),
    (N''6'', N''9'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'IdHero', N'IdTeam') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, NULL),
    (N''2'', 15, NULL),
    (N''3'', 10, NULL),
    (N''4'', 10, NULL),
    (N''5'', 5, NULL),
    (N''6'', 20, NULL),
    (N''7'', 45, NULL),
    (N''8'', 25, NULL),
    (N''9'', 30, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserId])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220520194113_TeamUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220520194113_TeamUser', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE TABLE [HeroTeam] (
        [HeroesId] nvarchar(450) NOT NULL,
        [TeamsId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([HeroesId], [TeamsId]),
        CONSTRAINT [FK_HeroTeam_Hero_HeroesId] FOREIGN KEY ([HeroesId]) REFERENCES [Hero] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_HeroTeam_Teams_TeamsId] FOREIGN KEY ([TeamsId]) REFERENCES [Teams] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''9fc253cb-71b2-4761-b3fc-e2743c3f5a45'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''7dc9036c-35f1-48d3-a36c-66831d461dbd'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''f2da22ef-0a85-45ea-979f-f7e2ae7b6abb'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''d4ca30d5-99a6-47de-b596-902628651b58'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''fe50258a-91d9-40bf-b665-7a724b2773cb'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''e2cbd05d-4d14-4778-81fe-fab69c46e985'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''25cb6a73-4f57-42dc-9930-5224d356a149'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''4129d043-c7ce-4c23-b39b-82e9785132e2'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''9e58683a-da83-404c-82cb-fb7afcfd90c7'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''d3b811e8-2fe4-41d2-ae4d-8479a4d77e5c'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon''),
    (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, NULL),
    (N''2'', 15, NULL),
    (N''3'', 10, NULL),
    (N''4'', 10, NULL),
    (N''5'', 5, NULL),
    (N''6'', 20, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''7'', 45, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''8'', 25, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''9'', 30, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserId])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_HeroTeam_TeamsId] ON [HeroTeam] ([TeamsId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521091004_HeroTeam2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521091004_HeroTeam2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [HeroTeam] (
        [TeamsId] nvarchar(450) NOT NULL,
        [HeroesId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([HeroesId], [TeamsId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Hero_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''95a6afa3-f551-4685-99ea-66cf33f4484e'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''c01e5abb-5ff6-4377-aaa2-87130acc2ee8'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''245538c9-67ea-4691-9f85-1330c2aa4448'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''8b6d38ac-e638-46e8-99d2-d06fc4b55c6a'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''47f02ee0-380a-483c-a609-932086ecc2f6'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''8635cd42-1864-4147-8300-f01e20d591a9'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''5592cae6-cd39-41ce-8521-21f9fc6884f5'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''e4b31287-43ed-41a1-9ab0-32a9c0b64074'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''1851187d-f5c7-4b66-b104-50c10a89e90f'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''5fe9d332-f46f-451d-8069-87053acbfbe2'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon''),
    (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon''),
    (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, NULL),
    (N''2'', 15, NULL),
    (N''3'', 10, NULL),
    (N''4'', 10, NULL),
    (N''5'', 5, NULL),
    (N''6'', 20, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''7'', 45, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''8'', 25, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''9'', 30, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserId])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserId') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [IX_Hero_UserId] ON [Hero] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103742_HeroTeamHeros')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521103742_HeroTeamHeros', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''bc6e86cc-86d9-40f8-81ed-03d01262c3d4'', [SecurityStamp] = N''d0433e47-e67d-45f9-8c06-3cd2194c388a''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''4d39deee-7c2b-4740-9f4a-c9bf1e2e0384'', [SecurityStamp] = N''d2876380-d31d-4eb7-a6f0-f5956e9a4633''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''7759c69b-e3e4-4d87-a247-9052aefa2d51'', [SecurityStamp] = N''490bbcb0-53e9-4776-a753-9672133207c1''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''ebe85c06-b875-4d04-968d-7cc03e876fdc'', [SecurityStamp] = N''10d461b8-f612-45ce-8fbb-0770f3dcee0b''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''55c748f6-7cc9-4a54-9ed3-b1093cedbc2a'', [SecurityStamp] = N''0116e8ab-903e-42da-8f39-b423faafc67a''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([HeroesId], [TeamsId])
    VALUES (N''1'', N''7''),
    (N''2'', N''7''),
    (N''3'', N''7''),
    (N''4'', N''7''),
    (N''5'', N''9''),
    (N''6'', N''9''),
    (N''7'', N''8'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521103908_HeroTeamConfiguration2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521103908_HeroTeamConfiguration2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''0e8ac540-613f-4660-a65a-1965d0fd1d29'', [SecurityStamp] = N''f25735ab-91c1-4852-b770-f715395f9f32''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''c0c1d1f1-2f9b-47ec-8ea3-fb0f760705d2'', [SecurityStamp] = N''cb360540-6138-4771-ae95-5e4885aacee5''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''67fbdaa9-e61e-41aa-9080-0707c105185d'', [SecurityStamp] = N''da4e78a2-f6ab-4e2a-9627-982e79a3f942''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''dc0632f8-0d28-4298-a980-5a91a861e802'', [SecurityStamp] = N''f679ecfe-0b36-41c0-a1c5-8b1309fcae4d''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''dcae25a3-83c1-4dd6-bd28-d5d557ca1c96'', [SecurityStamp] = N''dc7d860e-ee4f-49cd-bc6b-5d67feacbb75''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''6'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''7'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''4''
    WHERE [Id] = N''8'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''3''
    WHERE [Id] = N''9'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521104340_USerIdTeam')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521104340_USerIdTeam', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    ALTER TABLE [Teams] DROP CONSTRAINT [FK_Teams_AspNetUsers_UserId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC sp_rename N'[Teams].[UserId]', N'UserId1', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC sp_rename N'[Teams].[IX_Teams_UserId]', N'IX_Teams_UserId1', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''00b58f01-1c52-4961-9aac-a0209f63ac9e'', [SecurityStamp] = N''9ff461ea-6f05-48bb-ba9b-14e266757025''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''16fc0922-f99f-433c-914f-ed25eae75c7f'', [SecurityStamp] = N''44b9ba06-c4bb-457e-bac8-e7daae102ca2''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''b63b218e-224f-475e-90f7-6a88cbd26418'', [SecurityStamp] = N''50a071da-af95-4d76-a4ce-cfbfb3449747''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''005ce9ae-a83d-4598-bfdc-14df32ae6133'', [SecurityStamp] = N''1c9d3321-c8bf-43cf-9ace-b1a6647b7bac''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''890a6d8b-b455-483d-a031-96480837d15a'', [SecurityStamp] = N''cb2acd60-68d8-47cd-97ff-f1441e386f4e''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''6'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''7'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''8'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId1] = NULL
    WHERE [Id] = N''9'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    ALTER TABLE [Teams] ADD CONSTRAINT [FK_Teams_AspNetUsers_UserId1] FOREIGN KEY ([UserId1]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110321_zbeub')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521110321_zbeub', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    ALTER TABLE [Teams] DROP CONSTRAINT [FK_Teams_AspNetUsers_UserId1];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    DROP INDEX [IX_Teams_UserId1] ON [Teams];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Teams]') AND [c].[name] = N'UserId1');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Teams] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Teams] DROP COLUMN [UserId1];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    ALTER TABLE [Teams] ADD [UserId] nvarchar(450) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''23b8b436-fd53-49b5-9f9f-5a8cace5ad5a'', [SecurityStamp] = N''ee155784-b60e-41ab-9cf6-ab440fc40e9d''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''d5cce517-d3fa-497b-8afe-7cbce80b40dd'', [SecurityStamp] = N''f299203a-e8c3-4531-a7e0-ecba411c0f75''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''3174b0b5-70ef-4532-b3a2-a79094237cbd'', [SecurityStamp] = N''34a2ade4-26d7-4b9f-bcb2-bb9a85a18412''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''b64aeb49-9faf-4106-8a33-a6e036323bb6'', [SecurityStamp] = N''7debf448-7a1e-4fe9-b325-aac79bed2358''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''9c2aa1f5-54a2-4979-94d3-bc41d54ab3cf'', [SecurityStamp] = N''31109232-f1fd-4149-acdd-467721553485''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''6'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''2''
    WHERE [Id] = N''7'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''4''
    WHERE [Id] = N''8'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''3''
    WHERE [Id] = N''9'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    ALTER TABLE [Teams] ADD CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110408_zbeub2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521110408_zbeub2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''6310a63f-e8a5-42f1-a2b3-7ca63a69c724'', [SecurityStamp] = N''127cb51f-c0cf-4ff2-957a-de5266d41070''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''1c85dc0e-ca40-4b7e-ba99-c9b907b740e1'', [SecurityStamp] = N''c678213c-e702-4807-9fdc-46cecad28ba8''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''cf696099-bfbe-4254-8de7-19562491d130'', [SecurityStamp] = N''9ba6dcb6-c9fe-40ca-9abe-37d05004384f''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''56f5f78a-c788-40ed-a4bf-17e07f0d02b3'', [SecurityStamp] = N''7527be44-0999-435f-ab08-9d66930a393e''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''168967ef-70f5-4f66-91a5-98e74bd6bd28'', [SecurityStamp] = N''8b5bfb4d-1bf3-4bbf-873c-376f0f5d7ad6''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''5''
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''5''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''5''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''5''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''5''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    EXEC(N'UPDATE [Teams] SET [UserId] = N''5''
    WHERE [Id] = N''6'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521110852_User5Team')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521110852_User5Team', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] int NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserID] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [HeroTeam] (
        [TeamsId] nvarchar(450) NOT NULL,
        [HeroesId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([HeroesId], [TeamsId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''38dec4aa-05b9-4eb9-92cb-cbe6d9aa8bed'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''45d2c577-bf43-48ca-925f-29f8f15bf908'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''f4c993f8-2a47-4c2c-9162-f7e8ee17ac61'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''730a412b-d7f1-46cf-b501-5f57966bbd56'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''f7e6c385-d233-4c32-95cd-a5bdc14e2bf5'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''fafc7839-216d-40f3-b551-c9d637f61c4c'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''b342b938-d450-4606-8f36-c657611c5013'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''f4fdbb37-2bc5-405d-b252-5d73e3786aed'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''52f6182b-88cc-4637-92f8-a2a1595c14af'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''ce33e574-9275-4c40-bfa5-96caf0932235'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (1, N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (2, N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (3, N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (4, N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (1, N''Golem d’os'', 1),
    (1, N''Kobold'', 5),
    (1, N''Ogre'', 2),
    (1, N''Serwaul'', 1),
    (2, N''Efrit'', 2),
    (2, N''Fafnir'', 1),
    (2, N''Hydre'', 1),
    (2, N''Vouivre'', 2),
    (3, N''Dark Lord'', 1),
    (3, N''Serwaul'', 5),
    (4, N''Araignée'', 2),
    (4, N''Chauve - Souris'', 2),
    (4, N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserID') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserID])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserID') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([HeroesId], [TeamsId])
    VALUES (N''1'', N''7''),
    (N''2'', N''7''),
    (N''3'', N''7''),
    (N''4'', N''7''),
    (N''5'', N''9''),
    (N''6'', N''9''),
    (N''7'', N''8'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon''),
    (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, N''5''),
    (N''2'', 15, N''5''),
    (N''3'', 10, N''5''),
    (N''4'', 10, N''5''),
    (N''5'', 5, N''5''),
    (N''6'', 20, N''5''),
    (N''7'', 45, N''2''),
    (N''8'', 25, N''4''),
    (N''9'', 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522152459_UserIdHero')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220522152459_UserIdHero', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] nvarchar(450) NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserID] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [HeroTeam] (
        [TeamsId] nvarchar(450) NOT NULL,
        [HeroesId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([HeroesId], [TeamsId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''57477137-ba06-4af6-8c6a-fd7c0bc235c8'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''b53cc0fc-1e93-4194-bb5b-11acd894483a'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''86974322-41ba-4109-9dec-92c9624d887e'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''af54fa63-7f0c-4c53-9085-cf75a8481cb6'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''68d6dadf-75c0-4b0f-8a90-8536d49dd951'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''b474c5f7-7552-489f-9290-84f182ee5219'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''4580aa4b-e916-4cb4-9a37-f58161d62123'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''af0d3453-7b43-4d7c-84a4-81f52aa7ffb4'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''f4f1d6f0-3b4b-46d6-be3a-9d212f5c50f6'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''5acde77f-9eab-4819-8c7e-b40587177e23'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (N''1'', N''/Images/cover.jpg'', 0, N''Les Terres Brules''),
    (N''2'', N''/Images/IceDJ.jpg'', 0, N''Cours du hibou''),
    (N''3'', N''/Images/Desert.jpg'', 0, N''Temple de hrakas''),
    (N''4'', N''/Images/Forest.jpg'', 0, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (N''1'', N''Golem d’os'', 1),
    (N''1'', N''Kobold'', 5),
    (N''1'', N''Ogre'', 2),
    (N''1'', N''Serwaul'', 1),
    (N''2'', N''Efrit'', 2),
    (N''2'', N''Fafnir'', 1),
    (N''2'', N''Hydre'', 1),
    (N''2'', N''Vouivre'', 2),
    (N''3'', N''Dark Lord'', 1),
    (N''3'', N''Serwaul'', 5),
    (N''4'', N''Araignée'', 2),
    (N''4'', N''Chauve - Souris'', 2),
    (N''4'', N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserID') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserID])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserID') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([HeroesId], [TeamsId])
    VALUES (N''1'', N''7''),
    (N''2'', N''7''),
    (N''3'', N''7''),
    (N''4'', N''7''),
    (N''5'', N''9''),
    (N''6'', N''9''),
    (N''7'', N''8'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon''),
    (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, N''5''),
    (N''2'', 15, N''5''),
    (N''3'', 10, N''5''),
    (N''4'', 10, N''5''),
    (N''5'', 5, N''5''),
    (N''6'', 20, N''5''),
    (N''7'', 45, N''2''),
    (N''8'', 25, N''4''),
    (N''9'', 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220522234329_idDungeonToString')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220522234329_idDungeonToString', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''53ca4211-71ae-4129-b7df-62ea81080894'', [SecurityStamp] = N''d292437a-4e11-4ec8-8d0a-5df8f559a4fc''
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''dc12d4a4-1fa2-40be-8759-0726a2e996b6'', [SecurityStamp] = N''a40ddb9b-c733-43b0-9de0-4e39ba4b189c''
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''168a633f-e4ed-43ce-b2df-e266aceae796'', [SecurityStamp] = N''b6314b50-0d43-441f-8c02-4c6d022e2689''
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''8b35fa21-0550-4654-8e50-85bc697f55b7'', [SecurityStamp] = N''2353d683-257d-4f8e-961b-f730b726b14b''
    WHERE [Id] = N''5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [AspNetUsers] SET [ConcurrencyStamp] = N''e827adb0-2d77-431f-a41b-90e20b790cce'', [SecurityStamp] = N''9bbbe050-dfc1-4f77-82e8-438cff293d63''
    WHERE [Id] = N''b74ddd14-6340-4840-95c2-db12554843e5'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Level] = 24
    WHERE [Id] = N''1'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Level] = 42
    WHERE [Id] = N''2'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Level] = 55
    WHERE [Id] = N''3'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    EXEC(N'UPDATE [Dungeon] SET [Level] = 10
    WHERE [Id] = N''4'';
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523021057_LvlDj')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220523021057_LvlDj', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [NomHero] nvarchar(max) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [Dungeon] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Level] int NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Dungeon] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [DungeonMonstre] (
        [DungeonsId] nvarchar(450) NOT NULL,
        [MonstresNom] nvarchar(450) NOT NULL,
        [NbrMonstre] int NOT NULL,
        CONSTRAINT [PK_DungeonMonstre] PRIMARY KEY ([DungeonsId], [MonstresNom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [Hero] (
        [Id] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Classe] nvarchar(max) NOT NULL,
        [Nom] nvarchar(60) NOT NULL,
        [Image] nvarchar(max) NOT NULL DEFAULT N'Placeholder_hero.jpg',
        [Lvl] float NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        [UserID] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Hero] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [HeroTeam] (
        [TeamsId] nvarchar(450) NOT NULL,
        [HeroesId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_HeroTeam] PRIMARY KEY ([HeroesId], [TeamsId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [Monster] (
        [Nom] nvarchar(450) NOT NULL,
        [Race] nvarchar(max) NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        [Force] int NOT NULL,
        [Endurance] int NOT NULL,
        CONSTRAINT [PK_Monster] PRIMARY KEY ([Nom])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE TABLE [Teams] (
        [Id] nvarchar(450) NOT NULL,
        [Score] int NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''1'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] ON;
    EXEC(N'INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DateOfBirth], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NomHero], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES (N''2'', 0, N''4851d78b-db96-4f59-997d-64a94bc84014'', ''2000-06-01T00:00:00.0000000'', N''ghostkiller598r@gmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghostkiller'', N''GHOSTKILLER598R@GMAIL.COM'', N''GHOSTKILLER'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''98107cc2-01c9-400a-97ad-a1bcc8917bc3'', CAST(0 AS bit), N''Ghostkiller''),
    (N''3'', 0, N''7aa9f3d7-d42d-4a76-99fc-e5ddcceeb392'', ''2000-06-01T00:00:00.0000000'', N''nathanlombardelli@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Ghost'', N''NATHANLOMBARDELLI@HOTMAIL.COM'', N''GHOST'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''4042cfc8-e5a0-4afe-a43e-b0565525e896'', CAST(0 AS bit), N''Ghost''),
    (N''4'', 0, N''9782b4f5-5a3c-40cf-b25a-33c1703fc09f'', ''1980-02-22T00:00:00.0000000'', N''fabriceetverodehous@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''LOU'', N''FABRICEETVERODEHOUS@HOTMAIL.COM'', N''LOU'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''7ed4d951-909a-440b-b378-e6aa45dd6525'', CAST(0 AS bit), N''LOU''),
    (N''5'', 0, N''489cfa5b-168d-457f-9285-7a875d5b3660'', ''1982-06-01T00:00:00.0000000'', N''dejardinveronique.b159@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''Icare'', N''DEJARDINVERONIQUE.B159@HOTMAIL.COM'', N''ICARE'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''f81de9ad-5c68-41c3-8525-5f2c090e7349'', CAST(0 AS bit), N''Icare''),
    (N''b74ddd14-6340-4840-95c2-db12554843e5'', 0, N''438fdd42-d8d4-4175-8c53-e48b841a1f94'', ''0001-01-01T00:00:00.0000000'', N''admin@hotmail.com'', CAST(0 AS bit), CAST(0 AS bit), NULL, N''admin'', N''ADMIN@HOTMAIL.COM'', N''ADMIN'', N''AQAAAAEAACcQAAAAELY3l7KMPJBYl7Z0Fngt/XCak4QhuAWfJgf5qJHVqrpZ4A1sBs3YQLwSiZO+L15bsw=='', NULL, CAST(0 AS bit), N''1020b661-5f87-4d31-af23-7d667c52cc50'', CAST(0 AS bit), N''admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'ConcurrencyStamp', N'DateOfBirth', N'Email', N'EmailConfirmed', N'LockoutEnabled', N'LockoutEnd', N'NomHero', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
        SET IDENTITY_INSERT [AspNetUsers] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] ON;
    EXEC(N'INSERT INTO [Dungeon] ([Id], [Image], [Level], [Name])
    VALUES (N''1'', N''/Images/cover.jpg'', 24, N''Les Terres Brules''),
    (N''2'', N''/Images/IceDJ.jpg'', 42, N''Cours du hibou''),
    (N''3'', N''/Images/Desert.jpg'', 55, N''Temple de hrakas''),
    (N''4'', N''/Images/Forest.jpg'', 10, N''Foret celeste'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Image', N'Level', N'Name') AND [object_id] = OBJECT_ID(N'[Dungeon]'))
        SET IDENTITY_INSERT [Dungeon] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] ON;
    EXEC(N'INSERT INTO [DungeonMonstre] ([DungeonsId], [MonstresNom], [NbrMonstre])
    VALUES (N''1'', N''Golem d’os'', 1),
    (N''1'', N''Kobold'', 5),
    (N''1'', N''Ogre'', 2),
    (N''1'', N''Serwaul'', 1),
    (N''2'', N''Efrit'', 2),
    (N''2'', N''Fafnir'', 1),
    (N''2'', N''Hydre'', 1),
    (N''2'', N''Vouivre'', 2),
    (N''3'', N''Dark Lord'', 1),
    (N''3'', N''Serwaul'', 5),
    (N''4'', N''Araignée'', 2),
    (N''4'', N''Chauve - Souris'', 2),
    (N''4'', N''Loup Geant'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DungeonsId', N'MonstresNom', N'NbrMonstre') AND [object_id] = OBJECT_ID(N'[DungeonMonstre]'))
        SET IDENTITY_INSERT [DungeonMonstre] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserID') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] ON;
    EXEC(N'INSERT INTO [Hero] ([Id], [Classe], [Endurance], [Force], [Image], [Lvl], [Nom], [Race], [UserID])
    VALUES (N''1'', N''Magicien'', 5, 2, N''/Images/nainVoleur.jpg'', 5.0E0, N''Torain'', N''Nain'', N''2''),
    (N''2'', N''Guerrier'', 2, 5, N''/Images/orcGuerrier.jpg'', 3.0E0, N''Gurldac'', N''Orc'', N''2''),
    (N''3'', N''Archer'', 4, 3, N''/Images/elfeArcher.jpg'', 2.0E0, N''Oldin'', N''Elf'', N''2''),
    (N''4'', N''Voleur'', 6, 1, N''/Images/humainSorcier.jpg'', 5.0E0, N''Didier'', N''Humain'', N''2''),
    (N''5'', N''Voleur'', 2, 4, N''/Images/nainVoleur.jpg'', 3.0E0, N''Gibli'', N''Nain'', N''3''),
    (N''6'', N''Archer'', 1, 6, N''/Images/orcGuerrier.jpg'', 4.5E0, N''Gorduc'', N''Orc'', N''3''),
    (N''7'', N''Guerrier'', 3, 2, N''/Images/elfeArcher.jpg'', 5.0E0, N''Aldin'', N''Elf'', N''4'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Endurance', N'Force', N'Image', N'Lvl', N'Nom', N'Race', N'UserID') AND [object_id] = OBJECT_ID(N'[Hero]'))
        SET IDENTITY_INSERT [Hero] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] ON;
    EXEC(N'INSERT INTO [HeroTeam] ([HeroesId], [TeamsId])
    VALUES (N''1'', N''7''),
    (N''2'', N''7''),
    (N''3'', N''7''),
    (N''4'', N''7''),
    (N''5'', N''9''),
    (N''6'', N''9''),
    (N''7'', N''8'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HeroesId', N'TeamsId') AND [object_id] = OBJECT_ID(N'[HeroTeam]'))
        SET IDENTITY_INSERT [HeroTeam] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Araignée'', N''/Images/Monstre/spider.png'', 2, 2, N''Animal''),
    (N''Chauve - Souris'', N''/Images/Monstre/bat.png'', 2, 1, N''Animal''),
    (N''Dark Lord'', N''/Images/Monstre/DarkLord.png'', 20, 20, N''Démon''),
    (N''Efrit'', N''/Images/Monstre/efrit.png'', 4, 4, N''Monstre''),
    (N''Fafnir'', N''/Images/Monstre/Fafnir.png'', 7, 9, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] ON;
    EXEC(N'INSERT INTO [Monster] ([Nom], [Avatar], [Endurance], [Force], [Race])
    VALUES (N''Golem d’os'', N''/Images/Monstre/Bone_Golem.jpg'', 3, 5, N''Monstre''),
    (N''Grougaloragran'', N''/Images/Monstre/grougaloragran.png'', 12, 4, N''Dragon''),
    (N''Hydre'', N''/Images/Monstre/hydra.png'', 11, 5, N''Monstre''),
    (N''Kobold'', N''/Images/Monstre/kobold.png'', 4, 2, N''Monstre''),
    (N''Loup Geant'', N''/Images/Monstre/wolf.png'', 3, 4, N''Animal''),
    (N''Ogre'', N''/Images/Monstre/ogre.png'', 3, 1, N''Monstre''),
    (N''Serwaul'', N''/Images/Monstre/serwaul.png'', 1, 7, N''Démon''),
    (N''Vouivre'', N''/Images/Monstre/wyvern.png'', 15, 10, N''Dragon'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Nom', N'Avatar', N'Endurance', N'Force', N'Race') AND [object_id] = OBJECT_ID(N'[Monster]'))
        SET IDENTITY_INSERT [Monster] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] ON;
    EXEC(N'INSERT INTO [AspNetUserRoles] ([RoleId], [UserId])
    VALUES (N''fab4fac1-c546-41de-aebc-a14da6895711'', N''b74ddd14-6340-4840-95c2-db12554843e5'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
        SET IDENTITY_INSERT [AspNetUserRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    EXEC(N'INSERT INTO [Teams] ([Id], [Score], [UserId])
    VALUES (N''1'', 0, N''5''),
    (N''2'', 15, N''5''),
    (N''3'', 10, N''5''),
    (N''4'', 10, N''5''),
    (N''5'', 5, N''5''),
    (N''6'', 20, N''5''),
    (N''7'', 45, N''2''),
    (N''8'', 25, N''4''),
    (N''9'', 30, N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Score', N'UserId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    CREATE INDEX [IX_Teams_UserId] ON [Teams] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523045255_LastOne')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220523045255_LastOne', N'6.0.5');
END;
GO

COMMIT;
GO

