/*
    HOTELBOOKING DATABASE - SQL SERVER / SQL SERVER LOCALDB
    Generated from: HotelBooking/Migrations/20260819160621_InitialCreate.cs,
                    Data/ApplicationDbContext.cs and Data/DbInitializer.cs
    ORM: Entity Framework Core 8.0.11 + ASP.NET Core Identity
    Scope: exact migrated schema, relationships, indexes, EF migration history, example data
    Fresh DB is preferred. Re-running will NOT delete existing records.
    Demo accounts/passwords in this file are for LOCAL DEVELOPMENT ONLY.
    Execute complete file in SSMS connected to the SAME instance as appsettings.json.
*/
SET NOCOUNT ON;
IF DB_ID(N'HotelBookingDb') IS NULL CREATE DATABASE [HotelBookingDb];
GO
USE [HotelBookingDb];
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO
-- If a different/partial schema already exists, back it up and inspect before use.
-- __EFMigrationsHistory is explicitly maintained to prevent EF Core MigrateAsync()
-- from replaying 20260819160621_InitialCreate against these tables.

/* ========== 1. CREATE EXACT EF CORE TABLES ========== */
IF OBJECT_ID(N'dbo.[Amenities]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Amenities] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [Name] nvarchar(100) NOT NULL,
        [Icon] nvarchar(50) NOT NULL,
        [Category] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Amenities] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetRoles]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Description] nvarchar(max) NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetUsers]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [FullName] nvarchar(max) NOT NULL,
        [Address] nvarchar(max) NULL,
        [AvatarUrl] nvarchar(max) NULL,
        [CreatedAt] datetime2 NOT NULL,
        [IsActive] bit NOT NULL,
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
IF OBJECT_ID(N'dbo.[Hotels]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Hotels] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [Name] nvarchar(200) NOT NULL,
        [Slug] nvarchar(250) NULL,
        [Description] nvarchar(max) NOT NULL,
        [Address] nvarchar(250) NOT NULL,
        [City] nvarchar(100) NOT NULL,
        [Country] nvarchar(100) NOT NULL,
        [StarRating] int NOT NULL,
        [Phone] nvarchar(50) NULL,
        [Email] nvarchar(100) NULL,
        [MainImageUrl] nvarchar(500) NOT NULL,
        [IsFeatured] bit NOT NULL,
        [IsActive] bit NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Hotels] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[RoomTypes]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[RoomTypes] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [Name] nvarchar(100) NOT NULL,
        [Description] nvarchar(max) NULL,
        CONSTRAINT [PK_RoomTypes] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetRoleClaims]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetRoleClaims] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetUserClaims]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetUserClaims] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetUserLogins]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetUserRoles]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId])
    );
END;
GO
IF OBJECT_ID(N'dbo.[AspNetUserTokens]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name])
    );
END;
GO
IF OBJECT_ID(N'dbo.[Bookings]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Bookings] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [BookingCode] nvarchar(50) NOT NULL,
        [UserId] nvarchar(450) NULL,
        [HotelId] int NOT NULL,
        [CustomerName] nvarchar(100) NOT NULL,
        [CustomerEmail] nvarchar(100) NOT NULL,
        [CustomerPhone] nvarchar(30) NOT NULL,
        [CustomerAddress] nvarchar(250) NULL,
        [CheckInDate] datetime2 NOT NULL,
        [CheckOutDate] datetime2 NOT NULL,
        [TotalGuests] int NOT NULL,
        [TotalRooms] int NOT NULL,
        [SubTotal] decimal(18,2) NOT NULL,
        [TaxAmount] decimal(18,2) NOT NULL,
        [ServiceFee] decimal(18,2) NOT NULL,
        [TotalAmount] decimal(18,2) NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [Notes] nvarchar(max) NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Bookings] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[Favorites]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Favorites] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        [HotelId] int NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Favorites] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[HotelAmenities]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[HotelAmenities] (
        [HotelId] int NOT NULL,
        [AmenityId] int NOT NULL,
        CONSTRAINT [PK_HotelAmenities] PRIMARY KEY ([HotelId], [AmenityId])
    );
END;
GO
IF OBJECT_ID(N'dbo.[HotelImages]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[HotelImages] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [HotelId] int NOT NULL,
        [ImageUrl] nvarchar(500) NOT NULL,
        [Caption] nvarchar(150) NULL,
        [IsPrimary] bit NOT NULL,
        CONSTRAINT [PK_HotelImages] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[Reviews]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Reviews] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [HotelId] int NOT NULL,
        [UserId] nvarchar(450) NULL,
        [CustomerName] nvarchar(100) NOT NULL,
        [Rating] int NOT NULL,
        [Title] nvarchar(150) NULL,
        [Comment] nvarchar(max) NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Reviews] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[Rooms]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Rooms] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [HotelId] int NOT NULL,
        [RoomTypeId] int NOT NULL,
        [RoomNumber] nvarchar(50) NULL,
        [Name] nvarchar(150) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        [PricePerNight] decimal(18,2) NOT NULL,
        [Capacity] int NOT NULL,
        [BedInfo] nvarchar(100) NOT NULL,
        [AreaM2] float NOT NULL,
        [TotalQuantity] int NOT NULL,
        [AvailableQuantity] int NOT NULL,
        [IsActive] bit NOT NULL,
        [ImageUrl] nvarchar(500) NOT NULL,
        CONSTRAINT [PK_Rooms] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[Payments]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[Payments] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [BookingId] int NOT NULL,
        [PaymentCode] nvarchar(50) NOT NULL,
        [Amount] decimal(18,2) NOT NULL,
        [PaymentMethod] nvarchar(50) NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [TransactionRef] nvarchar(100) NULL,
        [PaidAt] datetime2 NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Payments] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[BookingDetails]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[BookingDetails] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [BookingId] int NOT NULL,
        [RoomId] int NOT NULL,
        [RoomName] nvarchar(150) NOT NULL,
        [PricePerNight] decimal(18,2) NOT NULL,
        [Quantity] int NOT NULL,
        [Nights] int NOT NULL,
        [SubTotal] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_BookingDetails] PRIMARY KEY ([Id])
    );
END;
GO
IF OBJECT_ID(N'dbo.[RoomAmenities]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[RoomAmenities] (
        [RoomId] int NOT NULL,
        [AmenityId] int NOT NULL,
        CONSTRAINT [PK_RoomAmenities] PRIMARY KEY ([RoomId], [AmenityId])
    );
END;
GO
IF OBJECT_ID(N'dbo.[RoomImages]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[RoomImages] (
        [Id] int IDENTITY(1,1) NOT NULL,
        [RoomId] int NOT NULL,
        [ImageUrl] nvarchar(500) NOT NULL,
        [Caption] nvarchar(150) NULL,
        [IsPrimary] bit NOT NULL,
        CONSTRAINT [PK_RoomImages] PRIMARY KEY ([Id])
    );
END;
GO

/* ========== 2. FOREIGN KEYS ========== */
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_AspNetRoleClaims_AspNetRoles_RoleId' AND parent_object_id = OBJECT_ID(N'dbo.[AspNetRoleClaims]'))
    ALTER TABLE [dbo].[AspNetRoleClaims] WITH CHECK ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_AspNetUserClaims_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[AspNetUserClaims]'))
    ALTER TABLE [dbo].[AspNetUserClaims] WITH CHECK ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_AspNetUserLogins_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[AspNetUserLogins]'))
    ALTER TABLE [dbo].[AspNetUserLogins] WITH CHECK ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_AspNetUserRoles_AspNetRoles_RoleId' AND parent_object_id = OBJECT_ID(N'dbo.[AspNetUserRoles]'))
    ALTER TABLE [dbo].[AspNetUserRoles] WITH CHECK ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_AspNetUserRoles_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[AspNetUserRoles]'))
    ALTER TABLE [dbo].[AspNetUserRoles] WITH CHECK ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_AspNetUserTokens_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[AspNetUserTokens]'))
    ALTER TABLE [dbo].[AspNetUserTokens] WITH CHECK ADD CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Bookings_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[Bookings]'))
    ALTER TABLE [dbo].[Bookings] WITH CHECK ADD CONSTRAINT [FK_Bookings_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE SET NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Bookings_Hotels_HotelId' AND parent_object_id = OBJECT_ID(N'dbo.[Bookings]'))
    ALTER TABLE [dbo].[Bookings] WITH CHECK ADD CONSTRAINT [FK_Bookings_Hotels_HotelId] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([Id]) ON DELETE NO ACTION;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Favorites_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[Favorites]'))
    ALTER TABLE [dbo].[Favorites] WITH CHECK ADD CONSTRAINT [FK_Favorites_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Favorites_Hotels_HotelId' AND parent_object_id = OBJECT_ID(N'dbo.[Favorites]'))
    ALTER TABLE [dbo].[Favorites] WITH CHECK ADD CONSTRAINT [FK_Favorites_Hotels_HotelId] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_HotelAmenities_Amenities_AmenityId' AND parent_object_id = OBJECT_ID(N'dbo.[HotelAmenities]'))
    ALTER TABLE [dbo].[HotelAmenities] WITH CHECK ADD CONSTRAINT [FK_HotelAmenities_Amenities_AmenityId] FOREIGN KEY ([AmenityId]) REFERENCES [dbo].[Amenities] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_HotelAmenities_Hotels_HotelId' AND parent_object_id = OBJECT_ID(N'dbo.[HotelAmenities]'))
    ALTER TABLE [dbo].[HotelAmenities] WITH CHECK ADD CONSTRAINT [FK_HotelAmenities_Hotels_HotelId] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_HotelImages_Hotels_HotelId' AND parent_object_id = OBJECT_ID(N'dbo.[HotelImages]'))
    ALTER TABLE [dbo].[HotelImages] WITH CHECK ADD CONSTRAINT [FK_HotelImages_Hotels_HotelId] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Reviews_AspNetUsers_UserId' AND parent_object_id = OBJECT_ID(N'dbo.[Reviews]'))
    ALTER TABLE [dbo].[Reviews] WITH CHECK ADD CONSTRAINT [FK_Reviews_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE SET NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Reviews_Hotels_HotelId' AND parent_object_id = OBJECT_ID(N'dbo.[Reviews]'))
    ALTER TABLE [dbo].[Reviews] WITH CHECK ADD CONSTRAINT [FK_Reviews_Hotels_HotelId] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Rooms_Hotels_HotelId' AND parent_object_id = OBJECT_ID(N'dbo.[Rooms]'))
    ALTER TABLE [dbo].[Rooms] WITH CHECK ADD CONSTRAINT [FK_Rooms_Hotels_HotelId] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Rooms_RoomTypes_RoomTypeId' AND parent_object_id = OBJECT_ID(N'dbo.[Rooms]'))
    ALTER TABLE [dbo].[Rooms] WITH CHECK ADD CONSTRAINT [FK_Rooms_RoomTypes_RoomTypeId] FOREIGN KEY ([RoomTypeId]) REFERENCES [dbo].[RoomTypes] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Payments_Bookings_BookingId' AND parent_object_id = OBJECT_ID(N'dbo.[Payments]'))
    ALTER TABLE [dbo].[Payments] WITH CHECK ADD CONSTRAINT [FK_Payments_Bookings_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [dbo].[Bookings] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_BookingDetails_Bookings_BookingId' AND parent_object_id = OBJECT_ID(N'dbo.[BookingDetails]'))
    ALTER TABLE [dbo].[BookingDetails] WITH CHECK ADD CONSTRAINT [FK_BookingDetails_Bookings_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [dbo].[Bookings] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_BookingDetails_Rooms_RoomId' AND parent_object_id = OBJECT_ID(N'dbo.[BookingDetails]'))
    ALTER TABLE [dbo].[BookingDetails] WITH CHECK ADD CONSTRAINT [FK_BookingDetails_Rooms_RoomId] FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Rooms] ([Id]) ON DELETE NO ACTION;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_RoomAmenities_Amenities_AmenityId' AND parent_object_id = OBJECT_ID(N'dbo.[RoomAmenities]'))
    ALTER TABLE [dbo].[RoomAmenities] WITH CHECK ADD CONSTRAINT [FK_RoomAmenities_Amenities_AmenityId] FOREIGN KEY ([AmenityId]) REFERENCES [dbo].[Amenities] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_RoomAmenities_Rooms_RoomId' AND parent_object_id = OBJECT_ID(N'dbo.[RoomAmenities]'))
    ALTER TABLE [dbo].[RoomAmenities] WITH CHECK ADD CONSTRAINT [FK_RoomAmenities_Rooms_RoomId] FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Rooms] ([Id]) ON DELETE CASCADE;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_RoomImages_Rooms_RoomId' AND parent_object_id = OBJECT_ID(N'dbo.[RoomImages]'))
    ALTER TABLE [dbo].[RoomImages] WITH CHECK ADD CONSTRAINT [FK_RoomImages_Rooms_RoomId] FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Rooms] ([Id]) ON DELETE CASCADE;
GO

/* ========== 3. INDEXES ========== */
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetRoleClaims]') AND name = N'IX_AspNetRoleClaims_RoleId')
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims] ([RoleId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetRoles]') AND name = N'RoleNameIndex')
    CREATE UNIQUE INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetUserClaims]') AND name = N'IX_AspNetUserClaims_UserId')
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims] ([UserId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetUserLogins]') AND name = N'IX_AspNetUserLogins_UserId')
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins] ([UserId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetUserRoles]') AND name = N'IX_AspNetUserRoles_RoleId')
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles] ([RoleId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetUsers]') AND name = N'EmailIndex')
    CREATE INDEX [EmailIndex] ON [dbo].[AspNetUsers] ([NormalizedEmail]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[AspNetUsers]') AND name = N'UserNameIndex')
    CREATE UNIQUE INDEX [UserNameIndex] ON [dbo].[AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[BookingDetails]') AND name = N'IX_BookingDetails_BookingId')
    CREATE INDEX [IX_BookingDetails_BookingId] ON [dbo].[BookingDetails] ([BookingId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[BookingDetails]') AND name = N'IX_BookingDetails_RoomId')
    CREATE INDEX [IX_BookingDetails_RoomId] ON [dbo].[BookingDetails] ([RoomId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Bookings]') AND name = N'IX_Bookings_HotelId')
    CREATE INDEX [IX_Bookings_HotelId] ON [dbo].[Bookings] ([HotelId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Bookings]') AND name = N'IX_Bookings_UserId')
    CREATE INDEX [IX_Bookings_UserId] ON [dbo].[Bookings] ([UserId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Favorites]') AND name = N'IX_Favorites_HotelId')
    CREATE INDEX [IX_Favorites_HotelId] ON [dbo].[Favorites] ([HotelId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Favorites]') AND name = N'IX_Favorites_UserId')
    CREATE INDEX [IX_Favorites_UserId] ON [dbo].[Favorites] ([UserId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[HotelAmenities]') AND name = N'IX_HotelAmenities_AmenityId')
    CREATE INDEX [IX_HotelAmenities_AmenityId] ON [dbo].[HotelAmenities] ([AmenityId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[HotelImages]') AND name = N'IX_HotelImages_HotelId')
    CREATE INDEX [IX_HotelImages_HotelId] ON [dbo].[HotelImages] ([HotelId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Payments]') AND name = N'IX_Payments_BookingId')
    CREATE UNIQUE INDEX [IX_Payments_BookingId] ON [dbo].[Payments] ([BookingId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Reviews]') AND name = N'IX_Reviews_HotelId')
    CREATE INDEX [IX_Reviews_HotelId] ON [dbo].[Reviews] ([HotelId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Reviews]') AND name = N'IX_Reviews_UserId')
    CREATE INDEX [IX_Reviews_UserId] ON [dbo].[Reviews] ([UserId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[RoomAmenities]') AND name = N'IX_RoomAmenities_AmenityId')
    CREATE INDEX [IX_RoomAmenities_AmenityId] ON [dbo].[RoomAmenities] ([AmenityId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[RoomImages]') AND name = N'IX_RoomImages_RoomId')
    CREATE INDEX [IX_RoomImages_RoomId] ON [dbo].[RoomImages] ([RoomId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Rooms]') AND name = N'IX_Rooms_HotelId')
    CREATE INDEX [IX_Rooms_HotelId] ON [dbo].[Rooms] ([HotelId]);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.[Rooms]') AND name = N'IX_Rooms_RoomTypeId')
    CREATE INDEX [IX_Rooms_RoomTypeId] ON [dbo].[Rooms] ([RoomTypeId]);
GO

/* ========== 4. EF CORE MIGRATION TRACKING ========== */
IF OBJECT_ID(N'dbo.[__EFMigrationsHistory]', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[__EFMigrationsHistory] WHERE [MigrationId] = N'20260819160621_InitialCreate')
    INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260819160621_InitialCreate', N'8.0.11');
GO

/* ========== 5. DEVELOPMENT DEMO ROLES AND USERS ========== */
-- These use ASP.NET Core Identity V3 password hash format (PBKDF2/HMAC-SHA512, 100000 rounds).
-- Local test logins: admin@hotelbooking.com / Admin@123, staff@hotelbooking.com / Staff@123,
-- customer@hotelbooking.com / Customer@123, demo.user@hotelbooking.com / Customer@123.
-- Change/remove demo credentials before deploying anywhere outside a private local demo.
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetRoles WHERE NormalizedName = N'ADMIN')
  INSERT dbo.AspNetRoles (Id, Description, Name, NormalizedName, ConcurrencyStamp) VALUES (N'00c93cbc-d1ea-4422-a3d9-e880b45949cc', N'Role Admin', N'Admin', N'ADMIN', N'e2512e27-a9e4-4f7d-b111-e4da09ba705c');
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetRoles WHERE NormalizedName = N'STAFF')
  INSERT dbo.AspNetRoles (Id, Description, Name, NormalizedName, ConcurrencyStamp) VALUES (N'cab9e749-ea3e-454a-be7f-a059b64610c6', N'Role Staff', N'Staff', N'STAFF', N'f7007140-1abe-4ead-91db-906a2f62a2f8');
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetRoles WHERE NormalizedName = N'CUSTOMER')
  INSERT dbo.AspNetRoles (Id, Description, Name, NormalizedName, ConcurrencyStamp) VALUES (N'df573e35-ca16-4b86-8163-1efbf5025a18', N'Role Customer', N'Customer', N'CUSTOMER', N'a8f3215c-d8e7-4b94-8836-5caab5e9949c');
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUsers WHERE NormalizedEmail = N'ADMIN@HOTELBOOKING.COM')
  INSERT dbo.AspNetUsers (Id, FullName, Address, AvatarUrl, CreatedAt, IsActive, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
  VALUES (N'b524460c-6213-45cb-bc68-9c656a8e2033', N'Hệ Thống Quản Trị (Admin)', N'Hà Nội, Việt Nam', NULL, SYSUTCDATETIME(), 1, N'admin@hotelbooking.com', N'ADMIN@HOTELBOOKING.COM', N'admin@hotelbooking.com', N'ADMIN@HOTELBOOKING.COM', 1, N'AQAAAAIAAYagAAAAEAEA3OpAYVPQOsB8OLwoEOVK8edEpz/GQhyiH/hF0cYvG04ssxcMSpWC2oPTSV6Lvw==', N'8413ec1c-e6f2-4ab5-9eea-6267813e1738', N'07b23025-863e-4602-a376-0a8745421ad0', N'0901234567', 0, 0, NULL, 1, 0);
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUserRoles ur JOIN dbo.AspNetUsers u ON u.Id = ur.UserId JOIN dbo.AspNetRoles r ON r.Id = ur.RoleId WHERE u.NormalizedEmail = N'ADMIN@HOTELBOOKING.COM' AND r.NormalizedName = N'ADMIN')
  INSERT dbo.AspNetUserRoles (UserId, RoleId) SELECT u.Id, r.Id FROM dbo.AspNetUsers u CROSS JOIN dbo.AspNetRoles r WHERE u.NormalizedEmail = N'ADMIN@HOTELBOOKING.COM' AND r.NormalizedName = N'ADMIN';
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUsers WHERE NormalizedEmail = N'STAFF@HOTELBOOKING.COM')
  INSERT dbo.AspNetUsers (Id, FullName, Address, AvatarUrl, CreatedAt, IsActive, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
  VALUES (N'ad9b6c89-9b89-451e-8921-8a38f7fba317', N'Nguyễn Văn Lễ Tân', N'Đà Nẵng, Việt Nam', NULL, SYSUTCDATETIME(), 1, N'staff@hotelbooking.com', N'STAFF@HOTELBOOKING.COM', N'staff@hotelbooking.com', N'STAFF@HOTELBOOKING.COM', 1, N'AQAAAAIAAYagAAAAEGjzg6U5luhPoAzQkEjd4ySYDB5yQ1gGu8oYp3i1pYYN7nBPvOJHxni1WJbft6yOSw==', N'6dddcf86-f977-4f54-9f75-859ee96acb35', N'a4b3cb8b-1f1c-4049-9f16-a21b871959ea', N'0908888999', 0, 0, NULL, 1, 0);
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUserRoles ur JOIN dbo.AspNetUsers u ON u.Id = ur.UserId JOIN dbo.AspNetRoles r ON r.Id = ur.RoleId WHERE u.NormalizedEmail = N'STAFF@HOTELBOOKING.COM' AND r.NormalizedName = N'STAFF')
  INSERT dbo.AspNetUserRoles (UserId, RoleId) SELECT u.Id, r.Id FROM dbo.AspNetUsers u CROSS JOIN dbo.AspNetRoles r WHERE u.NormalizedEmail = N'STAFF@HOTELBOOKING.COM' AND r.NormalizedName = N'STAFF';
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUsers WHERE NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM')
  INSERT dbo.AspNetUsers (Id, FullName, Address, AvatarUrl, CreatedAt, IsActive, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
  VALUES (N'ce21651a-1abf-47ba-8cd5-ea6c8689f547', N'Nguyễn Văn An', N'Hà Nội, Việt Nam', NULL, SYSUTCDATETIME(), 1, N'customer@hotelbooking.com', N'CUSTOMER@HOTELBOOKING.COM', N'customer@hotelbooking.com', N'CUSTOMER@HOTELBOOKING.COM', 1, N'AQAAAAIAAYagAAAAEC1e6Sv1AXDteiTMoonrXNQ1u/tVExMCpWn1hJsRwhLCKO/pzlh3G3M9I5XhPbjkQw==', N'b01ca894-1472-443c-9863-ae49f0c2e45f', N'a080f19c-0418-46eb-bd26-fec665db48d2', N'0912345678', 0, 0, NULL, 1, 0);
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUserRoles ur JOIN dbo.AspNetUsers u ON u.Id = ur.UserId JOIN dbo.AspNetRoles r ON r.Id = ur.RoleId WHERE u.NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM' AND r.NormalizedName = N'CUSTOMER')
  INSERT dbo.AspNetUserRoles (UserId, RoleId) SELECT u.Id, r.Id FROM dbo.AspNetUsers u CROSS JOIN dbo.AspNetRoles r WHERE u.NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM' AND r.NormalizedName = N'CUSTOMER';
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUsers WHERE NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM')
  INSERT dbo.AspNetUsers (Id, FullName, Address, AvatarUrl, CreatedAt, IsActive, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
  VALUES (N'e52ee28b-eb8c-44cc-81b9-194644f8c0c1', N'Trần Thị Mai Hương', N'TP. Hồ Chí Minh, Việt Nam', NULL, SYSUTCDATETIME(), 1, N'demo.user@hotelbooking.com', N'DEMO.USER@HOTELBOOKING.COM', N'demo.user@hotelbooking.com', N'DEMO.USER@HOTELBOOKING.COM', 1, N'AQAAAAIAAYagAAAAEMkEVbxkLz4uMDBqSgUrAjZUrJ2wPPHlb1tPZhMlhd8V7HJvI+IeKx4p3CBUpI3K2w==', N'75520082-9796-441d-9be8-2bbd97f1780e', N'24f2de69-9f6c-4aad-93a6-dbdfcfe8e002', N'0987654321', 0, 0, NULL, 1, 0);
IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUserRoles ur JOIN dbo.AspNetUsers u ON u.Id = ur.UserId JOIN dbo.AspNetRoles r ON r.Id = ur.RoleId WHERE u.NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM' AND r.NormalizedName = N'CUSTOMER')
  INSERT dbo.AspNetUserRoles (UserId, RoleId) SELECT u.Id, r.Id FROM dbo.AspNetUsers u CROSS JOIN dbo.AspNetRoles r WHERE u.NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM' AND r.NormalizedName = N'CUSTOMER';
COMMIT TRANSACTION;
GO

/* ========== 6. AMENITIES AND ROOM TYPES (from DbInitializer) ========== */
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Wifi tốc độ cao miễn phí', N'bi-wifi', N'General');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Hồ bơi vô cực', N'bi-water', N'Wellness');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Buffet sáng sang trọng', N'bi-cup-hot', N'Service');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Phòng Gym & Yoga hiện đại', N'bi-activity', N'Wellness');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Spa & Massage thư giãn', N'bi-heart-pulse', N'Wellness');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Bãi đỗ xe an toàn miễn phí', N'bi-p-circle', N'General');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Xe đưa đón sân bay', N'bi-car-front', N'Service');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Quầy Bar / Sky Lounge', N'bi-cup-straw', N'Service');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Bãi biển riêng')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Bãi biển riêng', N'bi-umbrella', N'General');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Lễ tân phục vụ 24/7')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Lễ tân phục vụ 24/7', N'bi-clock-history', N'General');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Điều hòa 2 chiều', N'bi-snow', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Smart TV 4K Netflix', N'bi-tv', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Bồn tắm nằm Jacuzzi')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Bồn tắm nằm Jacuzzi', N'bi-droplet', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Ban công view toàn cảnh')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Ban công view toàn cảnh', N'bi-eye', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Két sắt an toàn điện tử', N'bi-shield-check', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Máy pha cafe Espresso cao cấp')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Máy pha cafe Espresso cao cấp', N'bi-cup', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.Amenities WHERE Name = N'Mini Bar & Tủ lạnh nhỏ')
  INSERT dbo.Amenities (Name, Icon, Category) VALUES (N'Mini Bar & Tủ lạnh nhỏ', N'bi-archive', N'Room');
IF NOT EXISTS (SELECT 1 FROM dbo.RoomTypes WHERE Name = N'Standard Room')
  INSERT dbo.RoomTypes (Name, Description) VALUES (N'Standard Room', N'Phòng tiêu chuẩn ấm cúng, đầy đủ tiện nghi thiết yếu.');
IF NOT EXISTS (SELECT 1 FROM dbo.RoomTypes WHERE Name = N'Superior City View')
  INSERT dbo.RoomTypes (Name, Description) VALUES (N'Superior City View', N'Phòng cao cấp ngắm toàn cảnh thành phố rực rỡ về đêm.');
IF NOT EXISTS (SELECT 1 FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View')
  INSERT dbo.RoomTypes (Name, Description) VALUES (N'Deluxe Ocean View', N'Phòng hạng sang có ban công ngắm nhìn đại dương tuyệt đẹp.');
IF NOT EXISTS (SELECT 1 FROM dbo.RoomTypes WHERE Name = N'Executive Suite')
  INSERT dbo.RoomTypes (Name, Description) VALUES (N'Executive Suite', N'Căn hộ suite sang trọng với phòng khách riêng và bồn tắm Jacuzzi.');
IF NOT EXISTS (SELECT 1 FROM dbo.RoomTypes WHERE Name = N'Family Luxury Suite')
  INSERT dbo.RoomTypes (Name, Description) VALUES (N'Family Luxury Suite', N'Không gian rộng rãi, thiết kế lý tưởng cho kỳ nghỉ gia đình 4-6 người.');
IF NOT EXISTS (SELECT 1 FROM dbo.RoomTypes WHERE Name = N'Presidential Suite')
  INSERT dbo.RoomTypes (Name, Description) VALUES (N'Presidential Suite', N'Đẳng cấp nguyên thủ quốc gia với nội thất hoàng gia đỉnh cao.');
COMMIT TRANSACTION;
GO

/* ========== 7. HOTELS, ROOMS, IMAGES AND M:N AMENITIES ========== */
BEGIN TRANSACTION;
-- Hotel 1: InterContinental Danang Sun Peninsula Resort
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'InterContinental Danang Sun Peninsula Resort', N'intercontinental-danang-sun-peninsula-resort', N'Khu nghỉ dưỡng sang trọng bậc nhất thế giới nằm ẩn mình bên bán đảo Sơn Trà hoang sơ, với thiết kế đỉnh cao của kiến trúc sư lừng danh Bill Bensley hòa quyện cùng thiên nhiên và di sản văn hóa Việt Nam.', N'Bán đảo Sơn Trà, Thọ Quang', N'Đà Nẵng', N'Việt Nam', 5, N'0236 393 8888', N'reservations.icdanang@ihg.com', N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -60, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'IC-101', N'Resort Classic Ocean View', N'Phòng rộng 70m2 với ban công ngoài trời hướng biển Đông ngút ngàn, bồn tắm đá cẩm thạch nguyên khối.', 8500000, 2, N'1 Giường King hoặc 2 Giường đơn', 70.0, 12, 10, 1, N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'IC-201', N'Terrace Suite Ocean View', N'Suite cao cấp với hiên tắm nắng riêng ngắm hoàng hôn, phòng khách riêng biệt và đồ uống mini bar thượng hạng.', 14200000, 2, N'1 Giường King Lớn', 95.0, 6, 5, 1, N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Presidential Suite'), N'IC-VIP1', N'Sun Peninsula Royal Villa', N'Biệt thự Hoàng Gia 2 tầng view trực diện vịnh biển, hồ bơi vô cực riêng và quản gia cá nhân phục vụ 24/7.', 35000000, 4, N'2 Giường King Size Thượng Hạng', 300.0, 2, 2, 1, N'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 2: JW Marriott Phu Quoc Emerald Bay Resort & Spa
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'JW Marriott Phu Quoc Emerald Bay Resort & Spa', N'jw-marriott-phu-quoc-emerald-bay', N'Kiệt tác nghỉ dưỡng bên bãi Khem cát trắng mịn như kem, thiết kế theo trường đại học Lamarck huyền thoại với các phân khoa độc đáo và hồ bơi vỏ sò mang tính biểu tượng.', N'Bãi Khem, An Thới', N'Phú Quốc', N'Việt Nam', 5, N'0297 377 9999', N'mhrs.pqcjw.reservations@marriott.com', N'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -50, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'JW-102', N'Emerald Bay View Deluxe', N'Phòng Deluxe sang trọng nhìn ra vịnh ngọc lam biếc, trần nhà cao thoáng đãng cùng nội thất phong cách cổ điển thanh lịch.', 6800000, 2, N'1 Giường Đôi Cực Lớn', 54.0, 15, 12, 1, N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'JW-205', N'Turquoise Suite', N'Căn suite màu ngọc bích lãng mạn có ban công ngắm bình minh trên biển, bồn tắm đứng độc lập và trà chiều miễn phí.', 12500000, 2, N'1 Giường King', 90.0, 8, 6, 1, N'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Family Luxury Suite'), N'JW-FAM1', N'Lamarck Family Villa', N'Biệt thự gia đình 2 phòng ngủ có sân vườn riêng và hồ bơi mini, lý tưởng cho chuyến nghỉ dưỡng sum vầy.', 21000000, 5, N'2 Giường King + 1 Giường Đơn', 180.0, 4, 3, 1, N'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND ImageUrl = N'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), N'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 3: Vinpearl Luxury Landmark 81
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Vinpearl Luxury Landmark 81', N'vinpearl-luxury-landmark-81', N'Khách sạn trên cao nhất Đông Nam Á, tọa lạc từ tầng 47 đến tầng 77 của tòa tháp Landmark 81, đem đến trải nghiệm nghỉ dưỡng chạm mây giữa trung tâm Sài Gòn phồn hoa.', N'720A Điện Biên Phủ, Phường 22, Quận Bình Thạnh', N'TP. Hồ Chí Minh', N'Việt Nam', 5, N'0283 910 1280', N'res.vplm81@vinpearl.com', N'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -45, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Superior City View'), N'LM-501', N'Premier Panoramic City View', N'Phòng nghỉ tầng 52 với cửa kính tràn bờ từ sàn đến trần chiêm ngưỡng toàn cảnh dòng sông Sài Gòn thơ mộng.', 5200000, 2, N'1 Giường King hoặc 2 Giường Đơn', 48.0, 20, 18, 1, N'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'LM-650', N'Executive Skyline Suite', N'Suite góc tầng 65 nhìn ngắm 360 độ toàn cảnh thành phố Hồ Chí Minh, quyền lợi Club Lounge thượng hạng.', 9800000, 2, N'1 Giường King Hoàng Gia', 82.0, 10, 8, 1, N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND ImageUrl = N'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), N'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 4: Sofitel Legend Metropole Hanoi
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Sofitel Legend Metropole Hanoi', N'sofitel-legend-metropole-hanoi', N'Khách sạn cổ kính mang tính biểu tượng lịch sử phong cách Pháp thuộc từ năm 1901 ngay trung tâm thủ đô Hà Nội, chỉ vài bước chân tới Hồ Gươm và Nhà Hát Lớn.', N'15 Phố Ngô Quyền, Phường Tràng Tiền, Quận Hoàn Kiếm', N'Hà Nội', N'Việt Nam', 5, N'0243 826 6919', N'h1555@sofitel.com', N'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -40, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'MET-105', N'Opera Wing Premium Room', N'Nội thất gỗ phong cách tân cổ điển Pháp, sàn gỗ lim ấm áp, bồn tắm vintage và dịch vụ mở giường đặc trưng.', 7200000, 2, N'1 Giường King Metropole MyBed', 48.0, 15, 12, 1, N'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'MET-302', N'Grand Prestige Heritage Suite', N'Nơi từng đón tiếp các nguyên thủ quốc gia và nghệ sĩ nổi tiếng, có thư phòng cổ điển, phòng khách tráng lệ.', 18500000, 2, N'1 Giường King Sang Trọng', 120.0, 3, 3, 1, N'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND ImageUrl = N'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), N'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 5: Six Senses Ninh Van Bay
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Six Senses Ninh Van Bay', N'six-senses-ninh-van-bay', N'Khu nghỉ dưỡng 5 sao biệt lập ẩn mình giữa vịnh biển hoang sơ, bao bọc bởi những vách đá ấn tượng và rừng nguyên sinh nhiệt đới tươi tốt.', N'Vịnh Ninh Vân, Thị xã Ninh Hòa', N'Nha Trang', N'Việt Nam', 5, N'0258 352 4777', N'reservations-ninhvan@sixsenses.com', N'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -35, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'SS-08', N'Hill Top Pool Villa', N'Biệt thự trên đồi với hồ bơi vô cực riêng ngắm toàn cảnh vịnh biển Ninh Vân trong vắt như ngọc bích.', 16500000, 2, N'1 Giường King Lớn', 158.0, 8, 7, 1, N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'SS-15', N'Beachfront Pool Villa', N'Biệt thự bước thẳng ra bãi cát trắng mịn, có khu vườn riêng, hầm rượu vang nhỏ và bồn tắm gỗ thủ công ngoài trời.', 22000000, 3, N'1 Giường King + 1 Sofa Bed', 176.0, 6, 4, 1, N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND ImageUrl = N'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), N'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 6: Hotel de la Coupole - MGallery Sapa
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Hotel de la Coupole - MGallery Sapa', N'hotel-de-la-coupole-mgallery-sapa', N'Bản giao hưởng kỳ diệu giữa thời trang cao cấp Haute Couture nước Pháp thập niên 1920-1930 và sắc màu thổ cẩm vùng cao Tây Bắc mộng mơ.', N'1 Phố Hoàng Liên, Thị xã Sa Pa', N'Sapa', N'Việt Nam', 5, N'0214 362 9999', N'HA5V2-RE@accor.com', N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -30, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Superior City View'), N'MG-401', N'Classic Mountain View Room', N'Phòng mang phong cách Pháp với màu vàng mù tạt ấm áp, ban công view thung lũng Mường Hoa bồng bềnh biển mây.', 3800000, 2, N'1 Giường King hoặc 2 Giường Đơn', 33.0, 20, 16, 1, N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'MG-702', N'Executive Suite Sapa Clouds', N'Suite sang trọng tầng cao nhất với lò sưởi ấm áp, nội thất xa hoa và view dãy núi Fansipan hùng vĩ.', 7600000, 2, N'1 Giường King Lớn', 75.0, 5, 4, 1, N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 7: Four Seasons Resort The Nam Hai
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Four Seasons Resort The Nam Hai', N'four-seasons-resort-the-nam-hai', N'Ốc đảo thanh bình bên bờ biển Hà My thơ mộng, nơi nghệ thuật phong thủy truyền thống hòa cùng phong cách sống đỉnh cao của tập đoàn Four Seasons.', N'Khối Hà My Đông B, Điện Dương, Điện Bàn', N'Hội An', N'Việt Nam', 5, N'0235 394 0000', N'reservations.hoian@fourseasons.com', N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80', 0, 1, DATEADD(DAY, -25, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'FS-12', N'One-Bedroom Oceanfront Villa', N'Biệt thự giường tầng phong cách cung đình, vòi tắm hoa sen ngoài trời giữa khu vườn nhiệt đới thơm ngát.', 15500000, 2, N'1 Giường King Size', 80.0, 10, 8, 1, N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 8: Pullman Danang Beach Resort
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Pullman Danang Beach Resort', N'pullman-danang-beach-resort', N'Khu nghỉ dưỡng biển quốc tế 5 sao nằm ngay trên bờ biển Bắc Mỹ An tuyệt đẹp, chỉ 10 phút di chuyển từ sân bay quốc tế Đà Nẵng.', N'101 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ Hành Sơn', N'Đà Nẵng', N'Việt Nam', 5, N'0236 395 8888', N'h8838@accor.com', N'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80', 0, 1, DATEADD(DAY, -20, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Superior City View'), N'PL-204', N'Superior Garden View', N'Phòng nghỉ tiện nghi nhìn ra khu vườn nhiệt đới xanh mát và hồ bơi uốn lượn.', 3200000, 2, N'1 Giường King hoặc 2 Giường Đơn', 42.0, 18, 15, 1, N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'PL-405', N'Deluxe Ocean Cliff Room', N'Phòng ban công riêng ngắm sóng biển dạt dào, bồn tắm sâu và minibar phục vụ đồ uống tươi mát.', 4800000, 2, N'1 Giường King', 50.0, 12, 10, 1, N'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), N'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 9: Sheraton Saigon Grand Opera Hotel
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Sheraton Saigon Grand Opera Hotel', N'sheraton-saigon-grand-opera-hotel', N'Khách sạn 5 sao cao cấp tọa lạc tại vị trí vàng trên đường Đồng Khởi sầm uất, liền kề Nhà Hát Thành Phố và phố đi bộ Nguyễn Huệ.', N'88 Đường Đồng Khởi, Phường Bến Nghé, Quận 1', N'TP. Hồ Chí Minh', N'Việt Nam', 5, N'0283 827 2828', N'sheratonsaigon@sheraton.com', N'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80', 0, 1, DATEADD(DAY, -18, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'SH-1402', N'Premier Deluxe City View', N'Phòng nghỉ sang trọng nhìn ra đường Đồng Khởi rực rỡ ánh đèn hoa lệ, nệm Sheraton Signature Sleep Experience.', 4500000, 2, N'1 Giường King hoặc 2 Giường Đơn', 38.0, 25, 22, 1, N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND ImageUrl = N'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), N'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 10: Amanoi Resort Vinh Hy
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Amanoi Resort Vinh Hy', N'amanoi-resort-vinh-hy', N'Khu nghỉ dưỡng 6 sao xa hoa bậc nhất Việt Nam thuộc tập đoàn Aman, nép mình giữa Vườn Quốc Gia Núi Chúa nhìn xuống Vịnh Vĩnh Hy tuyệt sắc.', N'Thôn Vĩnh Hy, Xã Vĩnh Hải, Huyện Ninh Hải', N'Ninh Thuận', N'Việt Nam', 5, N'0259 377 0777', N'amanoi.res@aman.com', N'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80', 1, 1, DATEADD(DAY, -15, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Executive Suite'), N'AM-01', N'Lake Pavilion Zen Villa', N'Biệt thự thiền định nổi trên mặt hồ sen tĩnh lặng, phòng xông hơi riêng và không gian yoga biệt lập.', 28000000, 2, N'1 Giường King Cực Lớn', 125.0, 4, 4, 1, N'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND ImageUrl = N'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), N'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 11: Melia Vinpearl Nha Trang Empire
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Melia Vinpearl Nha Trang Empire', N'melia-vinpearl-nha-trang-empire', N'Tòa nhà khách sạn 41 tầng hiện đại ngay trung tâm phố biển Nha Trang, hồ bơi vô cực tầng 6 ngắm trọn vịnh Nha Trang xanh ngát.', N'44-46 Đường Lê Thánh Tôn, Lộc Thọ', N'Nha Trang', N'Việt Nam', 5, N'0258 359 9999', N'melia.empire@vinpearl.com', N'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80', 0, 1, DATEADD(DAY, -12, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'ML-1808', N'Deluxe Bay View Suite', N'Căn hộ khách sạn đầy đủ khu bếp mini, phòng khách thoáng đãng và ban công ngắm biển.', 2600000, 2, N'1 Giường King', 45.0, 25, 20, 1, N'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND ImageUrl = N'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), N'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
-- Hotel 12: Banyan Tree Lang Co Resort
IF NOT EXISTS (SELECT 1 FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort')
  INSERT dbo.Hotels ([Name], [Slug], [Description], [Address], [City], [Country], [StarRating], [Phone], [Email], [MainImageUrl], [IsFeatured], [IsActive], [CreatedAt])
  VALUES (N'Banyan Tree Lang Co Resort', N'banyan-tree-lang-co-resort', N'Khu nghỉ dưỡng biệt thự biệt lập với hồ bơi riêng, lấy cảm hứng từ nghệ thuật chạm khắc cung đình Huế bên vịnh Lăng Cô thơ mộng.', N'Xã Lộc Vĩnh, Huyện Phú Lộc', N'Huế', N'Việt Nam', 5, N'0234 369 5888', N'langco@banyantree.com', N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80', 0, 1, DATEADD(DAY, -10, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06')
  INSERT dbo.Rooms ([HotelId], [RoomTypeId], [RoomNumber], [Name], [Description], [PricePerNight], [Capacity], [BedInfo], [AreaM2], [TotalQuantity], [AvailableQuantity], [IsActive], [ImageUrl]) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.RoomTypes WHERE Name = N'Deluxe Ocean View'), N'BT-06', N'Lagoon Pool Villa', N'Biệt thự thanh bình bên đầm phá tự nhiên, có hồ bơi riêng, sân tắm nắng và bồn tắm phong cách Á Đông.', 9200000, 2, N'1 Giường King Cỡ Lớn', 131.0, 10, 8, 1, N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80');
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Wifi tốc độ cao miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Hồ bơi vô cực'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Buffet sáng sang trọng'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Phòng Gym & Yoga hiện đại'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Spa & Massage thư giãn'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Bãi đỗ xe an toàn miễn phí'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Xe đưa đón sân bay'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelAmenities WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'))
  INSERT dbo.HotelAmenities (HotelId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Quầy Bar / Sky Lounge'));
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80' AND Caption = N'Mặt tiền khách sạn')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80', N'Mặt tiền khách sạn', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80' AND Caption = N'Khuôn viên & Hồ bơi')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), N'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80', N'Khuôn viên & Hồ bơi', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.HotelImages WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND ImageUrl = N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80' AND Caption = N'Nhà hàng sang trọng')
  INSERT dbo.HotelImages (HotelId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort'), N'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', N'Nhà hàng sang trọng', 0);
COMMIT TRANSACTION;
GO

/* ========== 8. EXTRA ROOM GALLERY, ROOM AMENITIES, FAVORITES ========== */
-- Extra demonstrative records for tables not originally filled by DbInitializer.cs.
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101') AND ImageUrl = N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'), N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201') AND ImageUrl = N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201'), N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-201'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1') AND ImageUrl = N'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1'), N'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-VIP1'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102') AND ImageUrl = N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102'), N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-102'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205') AND ImageUrl = N'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205'), N'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-205'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1') AND ImageUrl = N'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1'), N'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND RoomNumber = N'JW-FAM1'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501') AND ImageUrl = N'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501'), N'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-501'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650') AND ImageUrl = N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650'), N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND RoomNumber = N'LM-650'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105') AND ImageUrl = N'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105'), N'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-105'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302') AND ImageUrl = N'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302'), N'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sofitel-legend-metropole-hanoi') AND RoomNumber = N'MET-302'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08') AND ImageUrl = N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08'), N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-08'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15') AND ImageUrl = N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15'), N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'six-senses-ninh-van-bay') AND RoomNumber = N'SS-15'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401') AND ImageUrl = N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401'), N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-401'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702') AND ImageUrl = N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702'), N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'hotel-de-la-coupole-mgallery-sapa') AND RoomNumber = N'MG-702'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12') AND ImageUrl = N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12'), N'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'four-seasons-resort-the-nam-hai') AND RoomNumber = N'FS-12'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204') AND ImageUrl = N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204'), N'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-204'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405') AND ImageUrl = N'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405'), N'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'pullman-danang-beach-resort') AND RoomNumber = N'PL-405'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402') AND ImageUrl = N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402'), N'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'sheraton-saigon-grand-opera-hotel') AND RoomNumber = N'SH-1402'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01') AND ImageUrl = N'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01'), N'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'amanoi-resort-vinh-hy') AND RoomNumber = N'AM-01'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808') AND ImageUrl = N'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808'), N'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'melia-vinpearl-nha-trang-empire') AND RoomNumber = N'ML-1808'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomImages WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06') AND ImageUrl = N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80')
  INSERT dbo.RoomImages (RoomId, ImageUrl, Caption, IsPrimary) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06'), N'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', N'Hình ảnh phòng', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Điều hòa 2 chiều'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Smart TV 4K Netflix'));
IF NOT EXISTS (SELECT 1 FROM dbo.RoomAmenities WHERE RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06') AND AmenityId = (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'))
  INSERT dbo.RoomAmenities (RoomId, AmenityId) VALUES ((SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'banyan-tree-lang-co-resort') AND RoomNumber = N'BT-06'), (SELECT TOP (1) Id FROM dbo.Amenities WHERE Name = N'Két sắt an toàn điện tử'));
IF NOT EXISTS (SELECT 1 FROM dbo.Favorites WHERE UserId = (SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM') AND HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'))
  INSERT dbo.Favorites (UserId, HotelId, CreatedAt) VALUES ((SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM'), (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), SYSUTCDATETIME());
IF NOT EXISTS (SELECT 1 FROM dbo.Favorites WHERE UserId = (SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM') AND HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'))
  INSERT dbo.Favorites (UserId, HotelId, CreatedAt) VALUES ((SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM'), (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), SYSUTCDATETIME());
COMMIT TRANSACTION;
GO

/* ========== 8. SAMPLE REVIEWS ========== */
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.Reviews WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND Title = N'Kỳ nghỉ tuyệt vời không thể nào quên!')
  INSERT dbo.Reviews (HotelId, UserId, CustomerName, Rating, Title, Comment, Status, CreatedAt) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), (SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM'), N'Nguyễn Văn An', 5, N'Kỳ nghỉ tuyệt vời không thể nào quên!', N'Dịch vụ 5 sao đích thực, nhân viên phục vụ tận tình chu đáo. Phòng ốc sạch sẽ, view biển đẹp ngỡ ngàng. Chắc chắn sẽ quay lại!', N'Approved', DATEADD(DAY, -14, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Reviews WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay') AND Title = N'Trải nghiệm đẳng cấp, đồ ăn ngon tuyệt')
  INSERT dbo.Reviews (HotelId, UserId, CustomerName, Rating, Title, Comment, Status, CreatedAt) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'jw-marriott-phu-quoc-emerald-bay'), (SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM'), N'Trần Thị Mai Hương', 5, N'Trải nghiệm đẳng cấp, đồ ăn ngon tuyệt', N'Buffet sáng rất đa dạng món Á - Âu, hồ bơi tuyệt đẹp, không gian yên bình cho gia đình nghỉ dưỡng cuối tuần.', N'Approved', DATEADD(DAY, -7, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Reviews WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81') AND Title = N'View từ tầng cao ngắm Sài Gòn đỉnh chóp')
  INSERT dbo.Reviews (HotelId, UserId, CustomerName, Rating, Title, Comment, Status, CreatedAt) VALUES ((SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'vinpearl-luxury-landmark-81'), NULL, N'Lê Hoàng Nam', 5, N'View từ tầng cao ngắm Sài Gòn đỉnh chóp', N'Khách sạn sạch sẽ, sang trọng, vị trí trung tâm di chuyển rất tiện. Nhân viên thân thiện và chu đáo.', N'Approved', DATEADD(DAY, -3, SYSUTCDATETIME()));
COMMIT TRANSACTION;
GO

/* ========== 9. SAMPLE BOOKINGS + DETAILS + PAYMENTS ========== */
-- Seed booking dates are relative to the date you execute this script, just like DbInitializer.cs.
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-A8F2')
  INSERT dbo.Bookings (BookingCode, UserId, HotelId, CustomerName, CustomerEmail, CustomerPhone, CustomerAddress, CheckInDate, CheckOutDate, TotalGuests, TotalRooms, SubTotal, TaxAmount, ServiceFee, TotalAmount, Status, Notes, CreatedAt)
  VALUES (N'HB-20260819-A8F2', (SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'CUSTOMER@HOTELBOOKING.COM'), (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), N'Nguyễn Văn An', N'customer@hotelbooking.com', N'0912345678', N'Hà Nội, Việt Nam', DATEADD(DAY, 3, CONVERT(date, GETDATE())), DATEADD(DAY, 5, CONVERT(date, GETDATE())), 2, 1, ((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 2), CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 2) * 0.08) AS decimal(18,2)), CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 2) * 0.05) AS decimal(18,2)), CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 2) * 1.13) AS decimal(18,2)), N'Confirmed', N'Yêu cầu phòng tầng cao, giường đôi sạch sẽ.', DATEADD(DAY, -2, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.BookingDetails WHERE BookingId = (SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-A8F2') AND RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'))
  INSERT dbo.BookingDetails (BookingId, RoomId, RoomName, PricePerNight, Quantity, Nights, SubTotal)
  SELECT (SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-A8F2'), (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'), r.Name, r.PricePerNight, 1, 2, (r.PricePerNight * 2) FROM dbo.Rooms AS r WHERE r.Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101');
IF NOT EXISTS (SELECT 1 FROM dbo.Payments WHERE BookingId = (SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-A8F2'))
  INSERT dbo.Payments (BookingId, PaymentCode, Amount, PaymentMethod, Status, TransactionRef, PaidAt, CreatedAt)
  VALUES ((SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-A8F2'), N'PAY-VNPay-998822', CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 2) * 1.13) AS decimal(18,2)), N'VNPay', N'Completed', N'VNP14892301', DATEADD(DAY, -2, SYSUTCDATETIME()), DATEADD(DAY, -2, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-B1C4')
  INSERT dbo.Bookings (BookingCode, UserId, HotelId, CustomerName, CustomerEmail, CustomerPhone, CustomerAddress, CheckInDate, CheckOutDate, TotalGuests, TotalRooms, SubTotal, TaxAmount, ServiceFee, TotalAmount, Status, Notes, CreatedAt)
  VALUES (N'HB-20260819-B1C4', (SELECT TOP (1) Id FROM dbo.AspNetUsers WHERE NormalizedEmail = N'DEMO.USER@HOTELBOOKING.COM'), (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort'), N'Trần Thị Mai Hương', N'demo.user@hotelbooking.com', N'0987654321', N'TP. Hồ Chí Minh', DATEADD(DAY, 7, CONVERT(date, GETDATE())), DATEADD(DAY, 10, CONVERT(date, GETDATE())), 2, 1, ((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 3), CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 3) * 0.08) AS decimal(18,2)), CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 3) * 0.05) AS decimal(18,2)), CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 3) * 1.13) AS decimal(18,2)), N'Pending', N'Đến nhận phòng sau 14h.', DATEADD(HOUR, -5, SYSUTCDATETIME()));
IF NOT EXISTS (SELECT 1 FROM dbo.BookingDetails WHERE BookingId = (SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-B1C4') AND RoomId = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'))
  INSERT dbo.BookingDetails (BookingId, RoomId, RoomName, PricePerNight, Quantity, Nights, SubTotal)
  SELECT (SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-B1C4'), (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101'), r.Name, r.PricePerNight, 1, 3, (r.PricePerNight * 3) FROM dbo.Rooms AS r WHERE r.Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101');
IF NOT EXISTS (SELECT 1 FROM dbo.Payments WHERE BookingId = (SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-B1C4'))
  INSERT dbo.Payments (BookingId, PaymentCode, Amount, PaymentMethod, Status, TransactionRef, PaidAt, CreatedAt)
  VALUES ((SELECT TOP (1) Id FROM dbo.Bookings WHERE BookingCode = N'HB-20260819-B1C4'), N'PAY-MoMo-447711', CAST((((SELECT PricePerNight FROM dbo.Rooms WHERE Id = (SELECT TOP (1) Id FROM dbo.Rooms WHERE HotelId = (SELECT TOP (1) Id FROM dbo.Hotels WHERE Slug = N'intercontinental-danang-sun-peninsula-resort') AND RoomNumber = N'IC-101')) * 3) * 1.13) AS decimal(18,2)), N'MoMo', N'Pending', N'MOMO778899', NULL, DATEADD(HOUR, -5, SYSUTCDATETIME()));
COMMIT TRANSACTION;
GO

/* ========== 10. COUNTS FOR VERIFICATION ========== */
SELECT N'Amenities' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Amenities];
SELECT N'RoomTypes' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[RoomTypes];
SELECT N'Hotels' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Hotels];
SELECT N'Rooms' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Rooms];
SELECT N'HotelImages' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[HotelImages];
SELECT N'HotelAmenities' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[HotelAmenities];
SELECT N'RoomImages' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[RoomImages];
SELECT N'RoomAmenities' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[RoomAmenities];
SELECT N'Favorites' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Favorites];
SELECT N'Reviews' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Reviews];
SELECT N'Bookings' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Bookings];
SELECT N'BookingDetails' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[BookingDetails];
SELECT N'Payments' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[Payments];
SELECT N'AspNetUsers' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[AspNetUsers];
SELECT N'AspNetRoles' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[AspNetRoles];
SELECT N'AspNetUserRoles' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[AspNetUserRoles];
SELECT N'__EFMigrationsHistory' AS [TableName], COUNT(*) AS [RowCount] FROM dbo.[__EFMigrationsHistory];
GO
