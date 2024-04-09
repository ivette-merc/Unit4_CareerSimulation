/*
  Warnings:

  - You are about to drop the column `itemProductName` on the `reviews` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "item_productName_unique";

-- AlterTable
ALTER TABLE "reviews" DROP COLUMN "itemProductName";

-- CreateIndex
CREATE INDEX "item_productName_unique" ON "reviews"("itemId");
