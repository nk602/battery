/*
  Warnings:

  - You are about to drop the `GuranterDetails` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GuranterDetails" DROP CONSTRAINT "GuranterDetails_driverId_fkey";

-- DropTable
DROP TABLE "GuranterDetails";

-- CreateTable
CREATE TABLE "GuarantorDetails" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "mobileNo" INTEGER NOT NULL,
    "CAddress" TEXT NOT NULL,
    "PAddress" TEXT NOT NULL,
    "AdharId" INTEGER NOT NULL,
    "driverId" TEXT NOT NULL,

    CONSTRAINT "GuarantorDetails_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GuarantorDetails_mobileNo_key" ON "GuarantorDetails"("mobileNo");

-- AddForeignKey
ALTER TABLE "GuarantorDetails" ADD CONSTRAINT "GuarantorDetails_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("driverOldId") ON DELETE RESTRICT ON UPDATE CASCADE;
