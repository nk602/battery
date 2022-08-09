import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();


const createVehicleDetail = async(req,res) => {
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
      financerContactNo  :   financerContactNo ,
       },
    });
    console.log(user)
    if (!user) {
     throw new BadRequestError("user not found");
    }
    const dealer = await prisma.vehicleDetails.create({
        data: {
            vehicleRegNo:    vehicleRegNo,       
            regValidity:     regValidity, 
            vehicleType:     vehicleType,         
            chasisNo   :     chasisNo  ,        
            vehicleMake :    vehicleMake,      
            vehicleModel:    vehicleModel,
            vehicleFinanced: vehicleFinanced ,  
            purchaseDate :   purchaseDate  ,   
            financerName:    financerName,
            insuranceStatus: insuranceStatus,
            insuranceUpto :   insuranceUpto,
            financerContactNo: financerContactNo,
            driverId:          user.driverOldId
        }
    });

    res.status(200).send(dealer)
}


const  getVehicleDetail = async(req,res) => {
    const{financerContactNo} = req.body
    const user = await prisma.driver.findUnique({
      where: {
        id: req.user.userId,
      },
    });
    if (!user) {
      throw new BadRequestError("user not found");
    }
    const detail = await prisma.driver.findUnique({
       where: {
        financerContactNo:financerContactNo }
      });

     res.status(200).send(detail)
    }


 const createVehicleOwner = async(req,res) => {
  const {                         
    name       ,                
    CurrentAddress  ,   
    PermanentAddress  , 
    AdharId          , 
    } = req.body
          
          let { mobileNo  } = req.body
          mobileNo=parseInt(mobileNo)
  const user = await prisma.driver.findUnique({
   where: {
         mobileNo:mobileNo
             },
        });
  console.log(user)
  if (!user) {
   throw new BadRequestError("user not found");
  }
  const Owner = await prisma.vehicleOwner.create({
      data: {     
        name  :             name  ,
        mobileNo :          mobileNo ,
        CurrentAddress :    CurrentAddress ,
        PermanentAddress :  PermanentAddress,
        AdharId          :  AdharId,           
        driverId        :   user.driverOldId 
      }
  });

  res.status(200).send(Owner)
}


const getVehicleOwner = async(req,res) => {
  const{financerContactNo} = req.body
  const user = await prisma.driver.findUnique({
    where: {
      id: req.user.userId,
    },
  });
  if (!user) {
    throw new BadRequestError("user not found");
  }
  const Owner = await prisma.vehicleOwner.findUnique({
     where: {
      financerContactNo:financerContactNo }
  });

  res.status(200).send(Owner)
}


const  createGuarantorDetail = async(req,res) => {
  const{
           name      ,                    
           CurrentAddress  ,     
           PermanentAddress,    
          AdharId              
                  } = req.body
      let { mobileNo } = req.body
      mobileNo =parseInt( mobileNo )
  const user = await prisma.driver.findUnique({
    where: {
      id: req.user.userId,
    },
  });
  if (!user) {
    throw new BadRequestError("user not found");
  }
  const detail = await prisma.GuarantorDetails.create({
      data: {               
        name     :         name  ,          
        mobileNo  :        mobileNo ,   
        CurrentAddress   : CurrentAddress ,
        PermanentAddress : PermanentAddress ,
        AdharId        :   AdharId   ,
        driverId      :    driverId.user.driverOldId   
      }
  });

  res.status(200).send(detail)
}


const  getGuarantorDetail = async(req,res) => {
  const{referralContactNumber} = req.body
  const user = await prisma.driver.findUnique({
    where: {
      id: req.user.userId,
    },
  });
  if (!user) {
    throw new BadRequestError("user not found");
  }
  const detail = await prisma.GuarantorDetails.findUnique({
     where: {
      mobileNo :mobileNo
     }
  });

  res.status(200).send(detail)
}



export  {createVehicleDetail,getVehicleDetail,createVehicleOwner,getVehicleOwner,
         createGuarantorDetail,getGuarantorDetail
}