/*
  Warnings:

  - You are about to drop the column `driverID` on the `Driver` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[driverId]` on the table `Driver` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `driverId` to the `Driver` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Driver_driverID_key";

-- AlterTable
ALTER TABLE "Driver" DROP COLUMN "driverID",
ADD COLUMN     "driverId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Driver_driverId_key" ON "Driver"("driverId");
