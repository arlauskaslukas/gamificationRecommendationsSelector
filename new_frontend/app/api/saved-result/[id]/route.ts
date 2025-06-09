import prisma from "@/app/lib/prisma";
import { RecRow, RecRowOut } from "@/app/types/types";
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

    const groupISORecommendations = new Map<string, RecRowOut[]>();
    const groupWcagRecommendations = new Map<string, RecRowOut[]>();
    const elementsUsability = new Map<string, string>();

    for (const rec of result?.SavedUsabilityRecommendationsForGamificationElementsIso ||
      []) {
      const element =
        rec.usabilityRecommendationsForGamificationElementsIso
          .gamificationElement!;

      if (!groupISORecommendations.has(element)) {
        groupISORecommendations.set(element, []);
      }

      groupISORecommendations.get(element)!.push({
        id: rec.usabilityRecommendationsForGamificationElementsIso.id,
        disorder: "",
        recommendation:
          rec.usabilityRecommendationsForGamificationElementsIso
            .isoRecommendation!,
        elementUsabilityRecommendation:
          rec.usabilityRecommendationsForGamificationElementsIso
            .elementUsabilityRecommendation!,
        example: rec.usabilityRecommendationsForGamificationElementsIso.example,
        selectionStatus: rec.selectionStatus,
      });

      const elementUsability =
        await prisma.suitableGamificationElements.findFirst({
          where: { gamificationElement: element },
          select: { gamificationElement: true, usabilityRecommendation: true },
        });

      if (elementUsability) {
        elementsUsability.set(
          element,
          elementUsability.usabilityRecommendation!
        );
      }
    }

    result?.SavedUsabilityRecommendationsForGamificationElementsWcag22.forEach(
      (rec) => {
        if (
          !groupWcagRecommendations.has(
            rec.usabilityRecommendationsForGamificationElementsWcag22
              .gamificationElement!
          )
        ) {
          groupWcagRecommendations.set(
            rec.usabilityRecommendationsForGamificationElementsWcag22
              .gamificationElement!,
            []
          );
        }
        let newrecs = [
          ...(groupWcagRecommendations.get(
            rec.usabilityRecommendationsForGamificationElementsWcag22
              .gamificationElement!
          ) || []),
          {
            id: rec.usabilityRecommendationsForGamificationElementsWcag22.id,
            disorder:
              rec.usabilityRecommendationsForGamificationElementsWcag22
                .disorder!,
            recommendation:
              rec.usabilityRecommendationsForGamificationElementsWcag22
                .wcagRecommendation!,
            elementUsabilityRecommendation:
              rec.usabilityRecommendationsForGamificationElementsWcag22
                .elementUsabilityRecommendation!,
            example:
              rec.usabilityRecommendationsForGamificationElementsWcag22.example,
            selectionStatus: rec.selectionStatus,
          },
        ];
        groupWcagRecommendations.set(
          rec.usabilityRecommendationsForGamificationElementsWcag22
            .gamificationElement!,
          newrecs
        );
      }
    );
    console.log(elementsUsability);

    const returnableIso = Array.from(
      groupISORecommendations,
      ([element, recommendations]) => ({
        element,
        usabilityRecommendation: elementsUsability.get(element),
        recommendations,
      })
    );
    const returnableWcag = Array.from(
      groupWcagRecommendations,
      ([element, recommendations]) => ({
        element,
        usabilityRecommendation: elementsUsability.get(element),
        recommendations,
      })
    );

    const newResult = {
      name: result?.name,
      SavedGeneralisedRecommendation: result?.SavedGeneralisedRecommendation,
      SavedSuitableGamificationElements:
        result?.SavedSuitableGamificationElements,
      SavedNotSuitableGamificationElements:
        result?.SavedNotSuitableGamificationElements,
      SavedUsabilityRecommendationsForGamificationElementsIso: returnableIso,
      SavedUsabilityRecommendationsForGamificationElementsWcag22:
        returnableWcag,
    };

    return NextResponse.json(newResult, { status: 200 });
  } catch (error) {
    console.error("Error fetching saved result:", error);
    return NextResponse.json(
      { error: "Failed to fetch saved result" },
      { status: 500 }
    );
  }
}
