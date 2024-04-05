/*
  Warnings:

  - You are about to drop the column `name` on the `items` table. All the data in the column will be lost.
  - Added the required column `description` to the `items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `items` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "items" DROP COLUMN "name",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL;
