-- AlterTable
ALTER TABLE "VehicleDetails" ALTER COLUMN "financerContactNo" DROP NOT NULL;

-- AlterTable
ALTER TABLE "VehicleOwner" ALTER COLUMN "mobileNo" DROP NOT NULL,
ALTER COLUMN "mobileNo" SET DATA TYPE TEXT;
