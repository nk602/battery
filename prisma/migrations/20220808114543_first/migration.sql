-- CreateTable
CREATE TABLE "VehicleDetails" (
    "chasisNo" TEXT NOT NULL,
    "vehicleMake" TEXT NOT NULL,
    "vehicleModel" TEXT NOT NULL,
    "purchasedate" TEXT NOT NULL,
    "vehicleFinanced" TEXT NOT NULL,
    "financerName" TEXT NOT NULL,
    "driverId" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "VehicleDetails_chasisNo_key" ON "VehicleDetails"("chasisNo");
