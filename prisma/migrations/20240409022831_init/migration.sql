/*
  Warnings:

  - The primary key for the `comments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `comments` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Made the column `reviewsId` on table `comments` required. This step will fail if there are existing NULL values in that column.
  - Made the column `review` on table `reviews` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_reviewsId_fkey";

-- DropIndex
DROP INDEX "comments_id_key";

-- AlterTable
ALTER TABLE "comments" DROP CONSTRAINT "comments_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "reviewsId" SET NOT NULL,
ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "reviews" ALTER COLUMN "rating" SET DEFAULT 0,
ALTER COLUMN "review" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_reviewsId_fkey" FOREIGN KEY ("reviewsId") REFERENCES "reviews"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
