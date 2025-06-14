import prisma from "@/app/lib/prisma";
import { RecommendationStatus } from "@prisma/client";
import { NextRequest, NextResponse } from "next/server";

type RecommendationInput = {
  status: RecommendationStatus;
};

export async function POST(
  req: NextRequest,
  { params }: { params: { id: string; gid: string } }
) {
  const id = params.id;
  const gid = params.gid;
  if (!id && !gid) {
    return NextResponse.json({ error: "Missing ID" }, { status: 400 });
  }
  try {
    let { status }: RecommendationInput = await req.json();
    await prisma.savedElementUsabilityRecommendation.update({
      data: {
        selectionStatus: status,
      },
      where: {
        suitableGamificationElementsId_savedResultId: {
          savedResultId: Number(id),
          suitableGamificationElementsId: Number(gid),
        },
      },
    });
    return NextResponse.json({}, { status: 200 });
  } catch (e) {
    console.error(e);
    return NextResponse.json({}, { status: 409 });
  }
}
