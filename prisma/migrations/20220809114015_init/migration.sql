/*
  Warnings:

  - The primary key for the `VehicleDetails` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `VehicleDetails` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "VehicleDetails" DROP CONSTRAINT "VehicleDetails_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "VehicleDetails_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleDetails_id_key" ON "VehicleDetails"("id");
