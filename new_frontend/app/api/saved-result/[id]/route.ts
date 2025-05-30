import prisma from "@/app/lib/prisma";
import { NextRequest, NextResponse } from "next/server";

export async function POST(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const { id } = await params;
  if (!id) {
    return NextResponse.json({ error: "Missing ID" }, { status: 400 });
  }
  try {
    const result = await prisma.savedResult.findUnique({
      where: { id: Number(id) },
      include: {
        SavedGeneralisedRecommendation: {
          include: {
            generalisedRecommendation: true,
          },
          orderBy: {
            generalisedRecommendation: {
              id: "asc",
            },
          },
        },
        SavedSuitableGamificationElements: {
          include: {
            suitableGamificationElements: true,
          },
          orderBy: {
            suitableGamificationElements: {
              gamificationElement: "asc",
            },
          },
        },
        SavedNotSuitableGamificationElements: {
          include: {
            notSuitableGamificationElements: true,
          },
          orderBy: {
            notSuitableGamificationElements: {
              notSuitableGamificationElement: "asc",
            },
          },
        },
        SavedUsabilityRecommendationsForGamificationElementsIso: {
          include: {
            usabilityRecommendationsForGamificationElementsIso: true,
          },
          orderBy: {
            usabilityRecommendationsForGamificationElementsIso: {
              id: "asc",
            },
          },
        },
        SavedUsabilityRecommendationsForGamificationElementsWcag22: {
          include: {
            usabilityRecommendationsForGamificationElementsWcag22: true,
          },
          orderBy: {
            usabilityRecommendationsForGamificationElementsWcag22: {
              id: "asc",
            },
          },
        },
      },
    });
    return NextResponse.json(result, { status: 200 });
  } catch (error) {
    console.error("Error fetching saved result:", error);
    return NextResponse.json(
      { error: "Failed to fetch saved result" },
      { status: 500 }
    );
  }
}
