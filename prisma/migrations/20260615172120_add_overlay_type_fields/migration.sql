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
    "heroOverlayColor" TEXT,
    "heroOverlayType" TEXT NOT NULL DEFAULT 'rgba',
    "heroBorderColor" TEXT,
    "heroShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "newsletterTitle" TEXT,
    "newsletterDescription" TEXT,
    "newsletterBackgroundImage" TEXT,
    "newsletterOverlayColor" TEXT,
    "newsletterOverlayType" TEXT NOT NULL DEFAULT 'rgba',
    "newsletterBorderColor" TEXT,
    "newsletterShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "contactPageTitle" TEXT,
    "contactPageDescription" TEXT,
    "contactBackgroundImage" TEXT,
    "contactOverlayColor" TEXT,
    "contactOverlayType" TEXT NOT NULL DEFAULT 'rgba',
    "contactBorderColor" TEXT,
    "contactShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_site_settings" ("address", "brandName", "contactBackgroundImage", "contactBorderColor", "contactPageDescription", "contactPageTitle", "contactShowBorder", "createdAt", "email", "heroBackgroundImage", "heroBorderColor", "heroButtonText", "heroOverlayColor", "heroShowBorder", "heroSubtitle", "heroTitle", "id", "newsletterBackgroundImage", "newsletterBorderColor", "newsletterDescription", "newsletterShowBorder", "newsletterTitle", "openingHours", "phone", "tagline", "updatedAt") SELECT "address", "brandName", "contactBackgroundImage", "contactBorderColor", "contactPageDescription", "contactPageTitle", "contactShowBorder", "createdAt", "email", "heroBackgroundImage", "heroBorderColor", "heroButtonText", "heroOverlayColor", "heroShowBorder", "heroSubtitle", "heroTitle", "id", "newsletterBackgroundImage", "newsletterBorderColor", "newsletterDescription", "newsletterShowBorder", "newsletterTitle", "openingHours", "phone", "tagline", "updatedAt" FROM "site_settings";
DROP TABLE "site_settings";
ALTER TABLE "new_site_settings" RENAME TO "site_settings";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
