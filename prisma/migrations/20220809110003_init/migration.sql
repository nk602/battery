/*
  Warnings:

  - You are about to drop the column `CAddress` on the `GuarantorDetails` table. All the data in the column will be lost.
  - You are about to drop the column `PAddress` on the `GuarantorDetails` table. All the data in the column will be lost.
  - You are about to drop the column `CAddress` on the `VehicleOwner` table. All the data in the column will be lost.
  - You are about to drop the column `PAddress` on the `VehicleOwner` table. All the data in the column will be lost.
  - Added the required column `CurrentAddress` to the `GuarantorDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PermanentAddress` to the `GuarantorDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `CurrentAddress` to the `VehicleOwner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PermanentAddress` to the `VehicleOwner` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "GuarantorDetails" DROP COLUMN "CAddress",
DROP COLUMN "PAddress",
ADD COLUMN     "CurrentAddress" TEXT NOT NULL,
ADD COLUMN     "PermanentAddress" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "VehicleOwner" DROP COLUMN "CAddress",
DROP COLUMN "PAddress",
ADD COLUMN     "CurrentAddress" TEXT NOT NULL,
ADD COLUMN     "PermanentAddress" TEXT NOT NULL;
