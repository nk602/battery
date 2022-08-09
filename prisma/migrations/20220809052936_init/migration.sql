/*
  Warnings:

  - Added the required column `id` to the `VehicleDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `driverId` to the `VehicleOwner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `VehicleOwner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vehicleId` to the `VehicleOwner` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "VehicleDetails" ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "VehicleDetails_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "VehicleOwner" ADD COLUMN     "driverId" TEXT NOT NULL,
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "vehicleId" TEXT NOT NULL,
ADD CONSTRAINT "VehicleOwner_pkey" PRIMARY KEY ("id");
