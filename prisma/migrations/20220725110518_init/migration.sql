-- CreateTable
CREATE TABLE "Driver" (
    "id" SERIAL NOT NULL,
    "mobileNo" TEXT NOT NULL,
    "driverID" TEXT NOT NULL,
    "driverOldId" TEXT,
    "driver" TEXT,
    "code" INTEGER,
    "expiryIn" INTEGER,
    "currentIn" INTEGER,
    "bss" TEXT,
    "bssCode" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Driver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DealerData" (
    "id" SERIAL NOT NULL,
    "bssCode" TEXT,
    "bss" TEXT,
    "address" TEXT,
    "city" TEXT,
    "state" TEXT,
    "countryName" TEXT,
    "pincode" INTEGER,
    "coordinates" TEXT,

    CONSTRAINT "DealerData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Referral" (
    "id" SERIAL NOT NULL,
    "referralNo" SERIAL NOT NULL,
    "referralName" TEXT NOT NULL,
    "referralContact" INTEGER NOT NULL,
    "referralRelationship" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "driverId" TEXT NOT NULL,

    CONSTRAINT "Referral_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sid" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Driver_id_key" ON "Driver"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Driver_driverID_key" ON "Driver"("driverID");

-- CreateIndex
CREATE UNIQUE INDEX "Driver_driverOldId_key" ON "Driver"("driverOldId");

-- CreateIndex
CREATE UNIQUE INDEX "DealerData_id_key" ON "DealerData"("id");

-- CreateIndex
CREATE UNIQUE INDEX "DealerData_bssCode_key" ON "DealerData"("bssCode");

-- CreateIndex
CREATE UNIQUE INDEX "Referral_id_key" ON "Referral"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Referral_referralNo_key" ON "Referral"("referralNo");

-- CreateIndex
CREATE UNIQUE INDEX "Referral_referralContact_key" ON "Referral"("referralContact");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sid_key" ON "Session"("sid");

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("driverOldId") ON DELETE RESTRICT ON UPDATE CASCADE;
