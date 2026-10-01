-- Derived from src/Staas/Migrations/20260408141707_InitialCreate.Designer.cs
-- The EF migration class is currently empty, so this script mirrors the model snapshot.

CREATE DATABASE IF NOT EXISTS `sign`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `sign`;

CREATE TABLE IF NOT EXISTS `APITokens` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Description` LONGTEXT NOT NULL,
  `Signer` LONGTEXT NOT NULL,
  `Token` LONGTEXT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `SignedItems` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `CAKey` LONGTEXT NOT NULL,
  `Certificate` LONGTEXT NOT NULL,
  `Comment` LONGTEXT NOT NULL,
  `RekorLogEntry` LONGTEXT NOT NULL,
  `RekorLogEntryUUID` LONGTEXT NOT NULL,
  `Signature` LONGTEXT NOT NULL,
  `SignedAt` DATETIME(6) NOT NULL,
  `Signer` LONGTEXT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
