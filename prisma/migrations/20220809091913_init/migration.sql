/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `VehicleDetails` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "GuranterDetails" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "mobileNo" INTEGER NOT NULL,
    "CAddress" TEXT NOT NULL,
    "PAddress" TEXT NOT NULL,
    "AdharId" INTEGER NOT NULL,
    "driverId" TEXT NOT NULL,

    CONSTRAINT "GuranterDetails_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GuranterDetails_mobileNo_key" ON "GuranterDetails"("mobileNo");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleDetails_id_key" ON "VehicleDetails"("id");

-- AddForeignKey
ALTER TABLE "GuranterDetails" ADD CONSTRAINT "GuranterDetails_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("driverOldId") ON DELETE RESTRICT ON UPDATE CASCADE;
