/*
  Warnings:

  - You are about to drop the column `referralContact` on the `Referral` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[referralContactNumber]` on the table `Referral` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `referralContactNumber` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Referral_referralContact_key";

-- AlterTable
ALTER TABLE "Referral" DROP COLUMN "referralContact",
ADD COLUMN     "referralContactNumber" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Referral_referralContactNumber_key" ON "Referral"("referralContactNumber");
