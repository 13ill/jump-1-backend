-- CreateTable
CREATE TABLE "jump1_users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT,
    "role" TEXT NOT NULL DEFAULT 'admin',
    "project" TEXT NOT NULL DEFAULT 'jump1',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "jump1_users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jump1_categories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "priority" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "project" TEXT NOT NULL DEFAULT 'jump1',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "jump1_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jump1_products" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "categoryId" TEXT,
    "globalOrder" INTEGER,
    "categoryOrder" INTEGER,
    "price" INTEGER,
    "description" TEXT NOT NULL,
    "fullDescription" TEXT NOT NULL,
    "material" TEXT,
    "specifications" JSONB,
    "images" JSONB NOT NULL,
    "project" TEXT NOT NULL DEFAULT 'jump1',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "jump1_products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jump1_social_links" (
    "id" TEXT NOT NULL,
    "platform" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "project" TEXT NOT NULL DEFAULT 'jump1',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "jump1_social_links_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jump1_site_settings" (
    "id" TEXT NOT NULL,
    "brandName" TEXT NOT NULL DEFAULT 'Niwelry',
    "tagline" TEXT,
    "address" TEXT,
    "openingHours" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "project" TEXT NOT NULL DEFAULT 'jump1',
    "heroTitle" TEXT,
    "heroSubtitle" TEXT,
    "heroButtonText" TEXT,
    "heroBackgroundImage" TEXT,
    "heroTextStrokeColor" TEXT,
    "heroTextStrokeWidth" DOUBLE PRECISION NOT NULL DEFAULT 0.5,
    "heroBorderColor" TEXT,
    "heroShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "newsletterTitle" TEXT,
    "newsletterDescription" TEXT,
    "newsletterBackgroundImage" TEXT,
    "newsletterTextStrokeColor" TEXT,
    "newsletterTextStrokeWidth" DOUBLE PRECISION NOT NULL DEFAULT 0.5,
    "newsletterBorderColor" TEXT,
    "newsletterShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "contactPageTitle" TEXT,
    "contactPageDescription" TEXT,
    "contactBackgroundImage" TEXT,
    "contactTextStrokeColor" TEXT,
    "contactTextStrokeWidth" DOUBLE PRECISION NOT NULL DEFAULT 0.5,
    "contactBorderColor" TEXT,
    "contactShowBorder" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "jump1_site_settings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "jump1_users_email_key" ON "jump1_users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "jump1_categories_slug_key" ON "jump1_categories"("slug");

-- AddForeignKey
ALTER TABLE "jump1_products" ADD CONSTRAINT "jump1_products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "jump1_categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;
