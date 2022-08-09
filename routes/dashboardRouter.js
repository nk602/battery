import express from "express";


import {qrGenrator,postDealerDataCoordinates} from '../controllers/dashboardController.js'
import {createReferralData,getReferralData} from '../controllers/dashboardReferralController.js'
import {postDealerDataNewCoordinates} from '../controllers/dashboardControllerNew.js'
import {createDealerData,getDealerData} from '../controllers/dashboardDealerController.js'
const router = express.Router();

router.route("/qrGenrator").post(qrGenrator);
router.route("/postDealerDataCoordinates").post(postDealerDataCoordinates);
router.route("/postDealerDataNewCoordinates").post(postDealerDataNewCoordinates);
router.route("/createReferralData").post(createReferralData);
router.route("/getReferralData").post(getReferralData)

router.route("/createDealerData").post(createDealerData)
router.route("/getDealerData").post(getDealerData)

export default router;
