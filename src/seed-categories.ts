import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function seedCategories() {
  const categories = [
    { name: 'แหวน', slug: 'ring', priority: 1 },
    { name: 'สร้อยคอ', slug: 'necklace', priority: 2 },
    { name: 'สร้อยข้อมือ', slug: 'bracelet', priority: 3 },
    { name: 'ต่างหู', slug: 'earring', priority: 4 },
    { name: 'จี้', slug: 'pendant', priority: 5 },
  ];

  for (const category of categories) {
    await prisma.category.upsert({
      where: { slug: category.slug },
      update: {},
      create: category,
    });
  }

  console.log('✅ Categories seeded successfully');
}

seedCategories()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
