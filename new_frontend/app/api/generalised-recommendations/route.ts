import { NextRequest, NextResponse } from "next/server";
import prisma from "@/app/lib/prisma";
import { buildWhere } from "@/app/lib/helpers/filterBuilder";
import { deduplicate } from "@/app/lib/helpers/deduplicate";

export async function POST(request: NextRequest) {
  let body = await request.json();
  body = {
    ...body,
    ageGroup: body.ageGroup ?? [],
    applicationDomain: body.applicationDomain ?? [],
    disorder: body.disorder ?? [],
    usabilityGoal: body.usabilityGoal ?? [],
    gamificationGoal: body.gamificationGoal ?? [],
    usabilityPrinciple: body.usabilityPrinciple ?? [],
  };

  // Build where clause – include optional usabilityGoal & gamificationGoal
  const where = buildWhere(body, [
    "ageGroup",
    "applicationDomain",
    "disorder",
    "usabilityGoal",
    "gamificationGoal",
    "usabilityPrinciple",
  ]);

  const data = await prisma.generalisedRecommendations.findMany({
    where,
    orderBy: { ruleIdx: "asc" },
  });
  const deduplicatedData = deduplicate(data);
  return NextResponse.json(deduplicatedData);
}
