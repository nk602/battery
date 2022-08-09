import express from "express";


import {qrGenrator,postDealerDataCoordinates} from '../controllers/dashboardController.js'
import {createReferralData,getReferralData} from '../controllers/dashboardReferralController.js'
import {postDealerDataNewCoordinates} from '../controllers/dashboardControllerNew.js'
import {    createVehicleDetail,getVehicleDetail,createVehicleOwner,
            getVehicleOwner,createGuarantorDetail,getGuarantorDetail 
     } from '../controllers/dashboardDealerController.js'

const router = express.Router();

router.route("/qrGenrator").post(qrGenrator);
router.route("/postDealerDataCoordinates").post(postDealerDataCoordinates);
router.route("/postDealerDataNewCoordinates").post(postDealerDataNewCoordinates);
router.route("/createReferralData").post(createReferralData);
router.route("/getReferralData").post(getReferralData)

router.route("/createVehicleDetail").post(createVehicleDetail)
router.route("/getVehicleDetail").post(getVehicleDetail)

router.route("/createVehicleOwner").post(createVehicleOwner)
router.route("/getVehicleOwner").post(getVehicleOwner)

router.route("/createGuarantorDetail").post(createGuarantorDetail)
router.route("/getGuarantorDetail").post(getGuarantorDetail)


export default router;
