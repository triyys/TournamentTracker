USE [master]
GO
/****** Object:  Database [TournamentTrackerDatabase]    Script Date: 2021-10-05 1:31:37 PM ******/
CREATE DATABASE [TournamentTrackerDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TournamentTrackerDatabase', FILENAME = N'C:\Users\MyPC\AppData\Local\Microsoft\VisualStudio\SSDT\TournamentTrackerDatabase\TournamentTrackerDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TournamentTrackerDatabase_log', FILENAME = N'C:\Users\MyPC\AppData\Local\Microsoft\VisualStudio\SSDT\TournamentTrackerDatabase\TournamentTrackerDatabase.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TournamentTrackerDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TournamentTrackerDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TournamentTrackerDatabase] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET ANSI_NULLS ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET ANSI_PADDING ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET ARITHABORT ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [TournamentTrackerDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TournamentTrackerDatabase] SET QUERY_STORE = OFF
GO
USE [TournamentTrackerDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TournamentTrackerDatabase]
GO
/****** Object:  Table [dbo].[MatchupEntries]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchupEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatchupId] [int] NOT NULL,
	[ParentMatchupId] [int] NULL,
	[TeamCompetingId] [int] NULL,
	[Score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matchups]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matchups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[WinnerId] [int] NULL,
	[MatchupRound] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[CellphoneNumber] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prizes]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceNumber] [int] NOT NULL,
	[PlaceName] [nvarchar](50) NOT NULL,
	[PrizeAmount] [money] NULL,
	[PrizePercentage] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentEntries]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NULL,
	[TeamId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentPrizes]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentPrizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NULL,
	[PrizeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [nvarchar](100) NOT NULL,
	[EntryFee] [money] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_Matchups] FOREIGN KEY([MatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_Matchups]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_ParentMatchups] FOREIGN KEY([ParentMatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_ParentMatchups]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_Teams] FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_Teams]
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_Teams] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_Teams]
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_Tournaments]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_People]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_Teams]
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_Teams]
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_Tournaments]
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_Prizes] FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prizes] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_Prizes]
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_GetByMatchup]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchupEntries_GetByMatchup]
	@MatchupId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select *
	from dbo.MatchupEntries
	where MatchupId = @MatchupId;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchupEntries_Insert]
	@MatchupId INT,
	@ParentMatchupId INT,
	@TeamCompetingId INT,
	@id INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.MatchupEntries
	(
	    MatchupId,
	    ParentMatchupId,
	    TeamCompetingId
	)
	VALUES
	(
	    @MatchupId,  -- MatchupId - int
	    @ParentMatchupId,  -- ParentMatchupId - int
	    @TeamCompetingId   -- TeamCompetingId - int
	    );

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Update]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchupEntries_Update]
	@id INT,
	@TeamCompetingId INT = NULL,
	@Score FLOAT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.MatchupEntries
	SET TeamCompetingId = @TeamCompetingId, Score = @Score
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_GetByTournament]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchups_GetByTournament]
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT m.*
	FROM dbo.Matchups m
	WHERE m.TournamentId = @TournamentId
	ORDER BY MatchupRound;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchups_Insert]
	@TournamentId INT,
	@MatchupRound INT,
	@id INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Matchups
	(
	    TournamentId,
	    MatchupRound
	)
	VALUES
	(   @TournamentId, -- TournamentId - int
	    @MatchupRound  -- MatchupRound - int
	    );

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchups_Update]
	@id INT,
	@WinnerId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Matchups
	SET WinnerId = @WinnerId
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPeople_GetAll]
AS
	SELECT * FROM dbo.People;
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPeople_Insert]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@EmailAddress NVARCHAR(MAX),
	@CellphoneNumber VARCHAR(20),
	@id INT = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO dbo.People(FirstName, LastName, EmailAddress, CellphoneNumber)
	VALUES (@FirstName, @LastName, @EmailAddress, @CellphoneNumber);

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_GetByTournament]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrizes_GetByTournament]
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select p.*
	from dbo.Prizes p
	inner join dbo.TournamentPrizes t on p.id = t.PrizeId
	where t.TournamentId = @TournamentId;
END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrizes_Insert]
	@PlaceNumber int,
	@PlaceName nvarchar(50),
	@PrizeAmount money,
	@PrizePercentage float,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.Prizes (PlaceNumber, PlaceName, PrizeAmount, PrizePercentage)
	values (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetAll]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeam_GetAll]
AS
	SELECT * FROM dbo.Teams;
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeam_GetByTournament]
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT t.*
	FROM dbo.Teams t
	INNER JOIN dbo.TournamentEntries e ON t.id = e.TeamId
	WHERE e.TournamentId = @TournamentId;
END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_GetByTeam]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeamMembers_GetByTeam]
	@TeamId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT p.*
	FROM dbo.TeamMembers m
	INNER JOIN dbo.People p ON p.id = m.PersonId
	WHERE m.TeamId = @TeamId;
END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeamMembers_Insert]
	@TeamId INT,
	@PersonId INT,
	@id INT = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO dbo.TeamMembers
	(
	    TeamId,
	    PersonId
	)
	VALUES
	(   @TeamId, -- id - int
	    @PersonId -- TeamId - int
	    );

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTeams_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeams_Insert]
	@TeamName NVARCHAR(50),
	@id INT = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO dbo.Teams
	(
	    TeamName
	)
	VALUES (@TeamName);

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentEntries_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournamentEntries_Insert]
	@TournamentId INT,
	@TeamId INT,
	@id INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.TournamentEntries (TournamentId, TeamId)
	VALUES (@TournamentId, @TeamId);

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentPrizes_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournamentPrizes_Insert]
	@TournamentId INT,
	@PrizeId INT,
	@id INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.TournamentPrizes (TournamentId, PrizeId)
	VALUES (@TournamentId, @PrizeId);

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Complete]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournaments_Complete]
	@id INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Tournaments
	SET Active = 0
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_GetAll]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournaments_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM dbo.Tournaments
	WHERE Active = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Insert]    Script Date: 2021-10-05 1:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournaments_Insert]
	@TournamentName NVARCHAR(100),
	@EntryFee MONEY,
	@id INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Tournaments (TournamentName, EntryFee, Active)
	VALUES (@TournamentName, @EntryFee, 1);

	SELECT @id = SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [TournamentTrackerDatabase] SET  READ_WRITE 
GO
