/*
  Warnings:

  - You are about to drop the column `purchasedate` on the `VehicleDetails` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[financerContactNo]` on the table `VehicleDetails` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `financerContactNo` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `insuranceStatus` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `insuranceUpto` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `purchaseDate` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `regValidity` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vehicleRegNo` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vehicleType` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "VehicleDetails" DROP COLUMN "purchasedate",
ADD COLUMN     "financerContactNo" INTEGER NOT NULL,
ADD COLUMN     "insuranceStatus" TEXT NOT NULL,
ADD COLUMN     "insuranceUpto" TEXT NOT NULL,
ADD COLUMN     "purchaseDate" TEXT NOT NULL,
ADD COLUMN     "regValidity" TEXT NOT NULL,
ADD COLUMN     "vehicleRegNo" TEXT NOT NULL,
ADD COLUMN     "vehicleType" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "VehicleDetails_financerContactNo_key" ON "VehicleDetails"("financerContactNo");
