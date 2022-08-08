import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();


const createDealerData = async(req,res) => {
    const {  vehicleRegNo,       
             regValidity , 
             vehicleType ,         
             chasisNo    ,        
             vehicleMake  ,      
             vehicleModel,
             vehicleFinanced ,  
             purchaseDate   ,   
             financerName  ,       
             insuranceStatus ,  
             insuranceUpto  ,   
             
        } = req.body
        let {financerContactNo} = req.body
        financerContactNo=parseInt(financerContactNo)
    const user = await prisma.driver.findUnique({
      where: {
        id: req.user.userId,
      },
    });
    if (!user) {
      throw new BadRequestError("user not found");
    }
    const referral = await prisma.Referral.create({
        data: {
            vehicleRegNo: vehicleRegNo,       
            regValidity: regValidity, 
            vehicleType: vehicleType,         
            chasisNo   :chasisNo  ,        
            vehicleMake : vehicleMake,      
            vehicleModel:   vehicleModel,
            vehicleFinanced:vehicleFinanced ,  
            purchaseDate :  purchaseDate  ,   
            financerName:financerName,
            insuranceStatus: insuranceStatus,
            insuranceUpto :insuranceUpto,
            financerContactNo:financerContactNo,
            driverId:user.driverOldId
        }
    });

    res.status(200).send(referral)
}


const getDealerData = async(req,res) => {
    const{financerContactNo} = req.body
    const user = await prisma.driver.findUnique({
      where: {
        id: req.user.userId,
      },
    });
    if (!user) {
      throw new BadRequestError("user not found");
    }
    const dealer = await prisma.driver.findUnique({
       where: {
        financerContactNo:financerContactNo
       }
    });

    res.status(200).send(dealer)
}

export {createDealerData,getDealerData}