const {PrismaClient} = require("@prisma/client");
const { faker } = require("@faker-js/faker");
const bcrypt = require("bcrypt");
const prisma = new PrismaClient();

async function seed () {
    console.log("seeding the database")
    try {
        
          const data = Array.from({ length: 25 }).map(() => {
            return {
              productName: faker.commerce.productName(),
              product: faker.commerce.product(),
              description: faker.commerce.productDescription(),
            };
          });
          await prisma.items.createMany({ data });
          const items = await prisma.items.findMany();
        
    } catch (error) {
        console.log(error);
    }
}



if (require.main === module) {
  seed();
}