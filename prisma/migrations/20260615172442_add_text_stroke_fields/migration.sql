/*
  Warnings:

  - You are about to drop the column `contactOverlayColor` on the `site_settings` table. All the data in the column will be lost.
  - You are about to drop the column `contactOverlayType` on the `site_settings` table. All the data in the column will be lost.
  - You are about to drop the column `heroOverlayColor` on the `site_settings` table. All the data in the column will be lost.
  - You are about to drop the column `heroOverlayType` on the `site_settings` table. All the data in the column will be lost.
  - You are about to drop the column `newsletterOverlayColor` on the `site_settings` table. All the data in the column will be lost.
  - You are about to drop the column `newsletterOverlayType` on the `site_settings` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_site_settings" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "brandName" TEXT NOT NULL DEFAULT 'Niwelry',
    "tagline" TEXT,
    "address" TEXT,
    "openingHours" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "heroTitle" TEXT,
    "heroSubtitle" TEXT,
    "heroButtonText" TEXT,
    "heroBackgroundImage" TEXT,
    "heroTextStrokeColor" TEXT,
    "heroTextStrokeWidth" INTEGER NOT NULL DEFAULT 2,
    "heroBorderColor" TEXT,
    "heroShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "newsletterTitle" TEXT,
    "newsletterDescription" TEXT,
    "newsletterBackgroundImage" TEXT,
    "newsletterTextStrokeColor" TEXT,
    "newsletterTextStrokeWidth" INTEGER NOT NULL DEFAULT 2,
    "newsletterBorderColor" TEXT,
    "newsletterShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "contactPageTitle" TEXT,
    "contactPageDescription" TEXT,
    "contactBackgroundImage" TEXT,
    "contactTextStrokeColor" TEXT,
    "contactTextStrokeWidth" INTEGER NOT NULL DEFAULT 2,
    "contactBorderColor" TEXT,
    "contactShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_site_settings" ("address", "brandName", "contactBackgroundImage", "contactBorderColor", "contactPageDescription", "contactPageTitle", "contactShowBorder", "createdAt", "email", "heroBackgroundImage", "heroBorderColor", "heroButtonText", "heroShowBorder", "heroSubtitle", "heroTitle", "id", "newsletterBackgroundImage", "newsletterBorderColor", "newsletterDescription", "newsletterShowBorder", "newsletterTitle", "openingHours", "phone", "tagline", "updatedAt") SELECT "address", "brandName", "contactBackgroundImage", "contactBorderColor", "contactPageDescription", "contactPageTitle", "contactShowBorder", "createdAt", "email", "heroBackgroundImage", "heroBorderColor", "heroButtonText", "heroShowBorder", "heroSubtitle", "heroTitle", "id", "newsletterBackgroundImage", "newsletterBorderColor", "newsletterDescription", "newsletterShowBorder", "newsletterTitle", "openingHours", "phone", "tagline", "updatedAt" FROM "site_settings";
DROP TABLE "site_settings";
ALTER TABLE "new_site_settings" RENAME TO "site_settings";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
