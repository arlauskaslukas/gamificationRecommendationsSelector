import { buildWhere } from "@/app/lib/helpers/filterBuilder";
import prisma from "@/app/lib/prisma";
import { NextRequest, NextResponse } from "next/server";

export async function POST(request: NextRequest) {
  let body = await request.json();
  body = {
    ...body,
    ageGroup: body.ageGroup && !body.ageGroup.includes('Not applicable') ? body.ageGroup : [],
    applicationDomain: body.applicationDomain && !body.applicationDomain.includes('Not applicable') ? body.applicationDomain : [],
    disorder: body.disorder && !body.disorder.includes('Not applicable') ? body.disorder : [],
    usabilityGoal: body.usabilityGoal && !body.usabilityGoal.includes('Not applicable') ? body.usabilityGoal : [],
    gamificationGoal: body.gamificationGoal && !body.gamificationGoal.includes('Not applicable') ? body.gamificationGoal : [],
  };


  const critArrays = [
    body.ageGroup,
    body.applicationDomain,
    body.disorder,
    body.usabilityGoal,
    body.gamificationGoal,
  ];

  console.log(critArrays);

  const noFilters = critArrays.every((arr) => arr.length === 0);

  if (noFilters) {
    //   SELECT DISTINCT gamificationElement FROM suitable_gamification_elements
    const allNames = await prisma.suitableGamificationElements.findMany({
      select: { gamificationElement: true, id: true },
      distinct: ["gamificationElement"],
    });

    return NextResponse.json({
      suitable: allNames,
      notSuitable: [],
      other: [],
    });
  }

  const where = {
    ...(body.ageGroup.length && { ageGroup: { in: body.ageGroup } }),
    ...(body.applicationDomain.length && {
      applicationDomain: { in: body.applicationDomain },
    }),
    ...(body.disorder.length && { disorder: { in: body.disorder } }),
    ...(body.usabilityGoal.length && {
      usabilityGoal: { in: body.usabilityGoal },
    }),
    ...(body.gamificationGoal.length && {
      gamificationGoal: { in: body.gamificationGoal },
    }),
  };

  const [suitableRows, notRows, allNamesRows] = await Promise.all([
    prisma.suitableGamificationElements.findMany({
      where,
      select: { gamificationElement: true, id: true },
      distinct: ["gamificationElement"],
    }),
    prisma.notSuitableGamificationElements.findMany({
      where,
      select: { notSuitableGamificationElement: true, id: true },
      distinct: ["notSuitableGamificationElement"],
    }),
    prisma.suitableGamificationElements.findMany({
      select: { gamificationElement: true, id: true },
      distinct: ["gamificationElement"],
    }),
  ]);

  const notNamesSet = new Set(
    notRows.map((r) => r.notSuitableGamificationElement)
  );

  const suitable = suitableRows.filter(
    (r) => !notNamesSet.has(r.gamificationElement)
  );

  const notSuitable = notRows.map((r) => ({
    id: r.id,
    gamificationElement: r.notSuitableGamificationElement,
  }));
  const suitableNames = new Set(suitable.map((r) => r.gamificationElement));
  const other = allNamesRows.filter(
    (r) =>
      !suitableNames.has(r.gamificationElement) &&
      !notNamesSet.has(r.gamificationElement)
  );
  //  console.log("suitable", suitable);
  //console.log("other", other);
  return NextResponse.json({ suitable, notSuitable, other });
}
