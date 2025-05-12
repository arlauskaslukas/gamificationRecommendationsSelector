import { buildWhere } from "@/app/lib/helpers/filterBuilder";
import prisma from "@/app/lib/prisma";
import { NextRequest, NextResponse } from "next/server";

export async function POST(request: NextRequest) {
  let body = await request.json();
  body = {
    ...body,
    ageGroup: body.ageGroup ?? [],
    applicationDomain: body.applicationDomain ?? [],
    disorder: body.disorder ?? [],
    usabilityGoal: body.usabilityGoal ?? [],
    gamificationGoal: body.gamificationGoal ?? [],
  };
  const critArrays = [
    body.ageGroup,
    body.applicationDomain,
    body.disorder,
    body.usabilityGoal,
    body.gamificationGoal,
  ];

  const noFilters = critArrays.every((arr) => arr.length === 0);

  if (noFilters) {
    //   SELECT DISTINCT gamificationElement FROM suitable_gamification_elements
    const allNames = await prisma.suitableGamificationElements.findMany({
      select: { gamificationElement: true },
      distinct: ["gamificationElement"],
    });

    return NextResponse.json({
      suitable: [],
      notSuitable: [],
      other: allNames.map((o) => o.gamificationElement),
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
      distinct: ["gamificationElement"],
    }),
    prisma.notSuitableGamificationElements.findMany({
      where,
      select: { notSuitableGamificationElement: true },
      distinct: ["notSuitableGamificationElement"],
    }),
    prisma.suitableGamificationElements.findMany({
      select: { gamificationElement: true },
      distinct: ["gamificationElement"],
    }),
  ]);
  const notNamesSet = new Set(
    notRows.map((r) => r.notSuitableGamificationElement)
  );

  const notSuitable = [...notNamesSet];

  const suitable = suitableRows
    .filter((r) => !notNamesSet.has(r.gamificationElement))
    .map((r) => r.gamificationElement);

  const suitableNames = new Set(suitable.map((r) => r));
  const allNames = allNamesRows.map((r) => r.gamificationElement);

  const other = allNames.filter(
    (n) => !suitableNames.has(n) && !notNamesSet.has(n)
  );
  //  console.log("suitable", suitable);
  console.log("notSuitable", notSuitable);
  //console.log("other", other);
  return NextResponse.json({ suitable, notSuitable: notSuitable, other });
}
