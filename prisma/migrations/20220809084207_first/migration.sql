/*
  Warnings:

  - A unique constraint covering the columns `[mobileNo]` on the table `Driver` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Driver_mobileNo_key" ON "Driver"("mobileNo");

-- AddForeignKey
ALTER TABLE "VehicleDetails" ADD CONSTRAINT "VehicleDetails_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("driverOldId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VehicleOwner" ADD CONSTRAINT "VehicleOwner_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("driverOldId") ON DELETE RESTRICT ON UPDATE CASCADE;
