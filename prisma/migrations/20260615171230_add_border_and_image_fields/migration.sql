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
    "heroBorderColor" TEXT,
    "heroShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "newsletterTitle" TEXT,
    "newsletterDescription" TEXT,
    "newsletterBackgroundImage" TEXT,
    "newsletterBorderColor" TEXT,
    "newsletterShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "contactPageTitle" TEXT,
    "contactPageDescription" TEXT,
    "contactBackgroundImage" TEXT,
    "contactBorderColor" TEXT,
    "contactShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_site_settings" ("address", "brandName", "contactPageDescription", "contactPageTitle", "createdAt", "email", "heroBackgroundImage", "heroButtonText", "heroOverlayColor", "heroSubtitle", "heroTitle", "id", "newsletterDescription", "newsletterTitle", "openingHours", "phone", "tagline", "updatedAt") SELECT "address", "brandName", "contactPageDescription", "contactPageTitle", "createdAt", "email", "heroBackgroundImage", "heroButtonText", "heroOverlayColor", "heroSubtitle", "heroTitle", "id", "newsletterDescription", "newsletterTitle", "openingHours", "phone", "tagline", "updatedAt" FROM "site_settings";
DROP TABLE "site_settings";
ALTER TABLE "new_site_settings" RENAME TO "site_settings";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
