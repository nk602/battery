-- CreateTable
CREATE TABLE "VehicleOwner" (
    "name" TEXT NOT NULL,
    "mobileNo" INTEGER NOT NULL,
    "CAddress" TEXT NOT NULL,
    "PAddress" TEXT NOT NULL,
    "AdharId" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "VehicleOwner_mobileNo_key" ON "VehicleOwner"("mobileNo");
