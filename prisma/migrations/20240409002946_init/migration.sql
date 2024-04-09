/*
  Warnings:

  - You are about to drop the column `product_review` on the `reviews` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "item_productName_unique";

-- AlterTable
ALTER TABLE "reviews" DROP COLUMN "product_review",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "review" TEXT,
ALTER COLUMN "rating" DROP DEFAULT;
