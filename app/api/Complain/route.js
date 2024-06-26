const next = require('next')


import { NextApiRequest, NextApiResponse } from 'next';
import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';



const prisma = new PrismaClient();

export const  getAllCOmplain = async (q,page)=>{
  const item_per_page=10;
 
  try{
    const count = await  prisma.complain.count({
      where: {
        Complain: {
          contains: q,
        },
      },})
    const Complain = await  prisma.complain.findMany({
      relationLoadStrategy: 'join', // or 'query'
      include: {
      User: true,
    },
      where: {
        User: {
          OR: [
            { fname: { contains: q } }, // Search by first name
            { lname: { contains: q } },
            
          ],
        },
      },
      take: item_per_page,
      skip: (page - 1) * item_per_page,
    })
    return {count,Complain}
  }catch (error){
    console.log(error);
    throw new  Error("Failed to fetch user!");
  }
};



export async function GET() {
  try {

    const getAllCOmplain = await prisma.complain.findMany({
      relationLoadStrategy: 'join', // or 'query'
    include: {
      User: true,
    },
      
    });

    

    return NextResponse.json(getAllCOmplain);
  } catch (error) {
    console.log("Error fetching staff by id:", error);
    return NextResponse.error("Internal server error", 500);
  }
}


