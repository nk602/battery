import express from "express";
const app = express();
import dotenv from "dotenv";
import "express-async-errors";
dotenv.config();
import morgan from "morgan";
import  session from "express-session";
import flash from 'connect-flash'
import { PrismaSessionStore } from '@quixo3/prisma-session-store';
import { PrismaClient } from '@prisma/client'
const prisma =new PrismaClient()

import auth from "./middleware/authorization.js";
import dashboardRouter from "./routes/dashboardRouter.js"

//middleware
import authRouter from "./routes/authRouter.js";

//errors
import errorHandlerMiddleware from "./middleware/error-handler.js";
import notFoundMiddleware from "./middleware/not-found.js";

app.use(morgan("dev"));

app.use(express.json());

// app.use(cookieParser())
// Express session
app.use(
  session({
    cookie: {
     maxAge: 1000 * 60 * 60 * 24// ms
    },
    secret: process.env.SECRET,
    resave: true,
    saveUninitialized: true,
    store: new PrismaSessionStore(
      prisma,
      {
        checkPeriod: 2 * 60 * 1000,  //ms
        dbRecordIdIsSessionId: true,
        dbRecordIdFunction: undefined,
      }
    )
  })
);

app.use("/api/b1/auth", authRouter);
app.use('/api/b1/dashboard',auth,dashboardRouter)

app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);

const PORT = process.env.PORT || 5000;

app.get('/' , (req,res) =>{
    res.send('Hello there')
})


const start = async () =>{
    try {
        app.listen(PORT , (req,res) =>{
            console.log(`server is listening on port ${PORT}`)
        })
        
    } catch (error) {
        console.log(error)
        
    }
}

start()


