/*
  Warnings:

  - You are about to drop the column `financerContactNo` on the `VehicleDetails` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[mobleNo]` on the table `VehicleDetails` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `mobleNo` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Made the column `mobileNo` on table `VehicleOwner` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "VehicleDetails_financerContactNo_key";

-- AlterTable
ALTER TABLE "VehicleDetails" DROP COLUMN "financerContactNo",
ADD COLUMN     "mobleNo" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "VehicleOwner" ALTER COLUMN "mobileNo" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "VehicleDetails_mobleNo_key" ON "VehicleDetails"("mobleNo");
