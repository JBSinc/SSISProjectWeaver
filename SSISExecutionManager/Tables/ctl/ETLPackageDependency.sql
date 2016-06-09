﻿CREATE TABLE [ctl].[ETLPackageDependency]
  (
     [ETLPackageDependencyId]  INT IDENTITY(1, 1) NOT NULL
     ,[ETLPackageId]           INT NOT NULL
     ,[DependedOnETLPackageId] INT NOT NULL
     ,[EnabledInd]             BIT CONSTRAINT [DF_ETLPackageDependency_PackageEnabledInd] DEFAULT ((1)) NOT NULL
     ,[Comments]               VARCHAR(MAX) NULL
     ,[CreatedDate]            DATETIME2 (7) CONSTRAINT [DF_ETLPackageDependency_CreatedDate] DEFAULT (GETDATE()) NOT NULL
     ,[CreatedUser]            VARCHAR (50) CONSTRAINT [DF_ETLPackageDependency_CreatedUser] DEFAULT (SUSER_SNAME()) NOT NULL
     ,[LastUpdatedDate]        DATETIME2 (7) CONSTRAINT [DF_ETLPackageDependency_LastUpdatedDate] DEFAULT (GETDATE()) NOT NULL
     ,[LastUpdatedUser]        VARCHAR (50) CONSTRAINT [DF_ETLPackageDependency_LastUpdatedUser] DEFAULT (SUSER_SNAME()) NOT NULL,
     CONSTRAINT [PK_ETLPackageDependency] PRIMARY KEY ([ETLPackageDependencyId]),
     CONSTRAINT [FK_ETLPackageDependency_ETLPackage] FOREIGN KEY (ETLPackageId) REFERENCES [ctl].ETLPackage(ETLPackageId),
     CONSTRAINT [FK_ETLPackageDependency_ETLPackage_DependentOn] FOREIGN KEY ([DependedOnETLPackageId]) REFERENCES [ctl].ETLPackage(ETLPackageId),
     CONSTRAINT [AK_ETLPackageDependency_ETLPackageId_DependentOnETLPackageId] UNIQUE (ETLPackageId, [DependedOnETLPackageId]),
  ) 
