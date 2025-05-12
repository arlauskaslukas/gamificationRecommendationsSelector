-- CreateTable
CREATE TABLE "generalised_recommendations" (
    "rule_idx" INTEGER,
    "usabilityGoal" TEXT,
    "usabilityPrinciple" TEXT,
    "ageGroup" TEXT,
    "applicationDomain" TEXT,
    "disorder" TEXT,
    "gamificationGoal" TEXT,
    "genRecommendation" TEXT,
    "example" TEXT
);

-- CreateTable
CREATE TABLE "not_suitable_gamification_elements" (
    "rule_idx" INTEGER,
    "ageGroup" TEXT,
    "applicationDomain" TEXT,
    "disorder" TEXT,
    "usabilityGoal" TEXT,
    "gamificationGoal" TEXT,
    "duration" TEXT,
    "notSuitableGamificationElement" TEXT
);

-- CreateTable
CREATE TABLE "suitable_gamification_elements" (
    "rule_idx" INTEGER,
    "ageGroup" TEXT,
    "applicationDomain" TEXT,
    "disorder" TEXT,
    "gamificationGoal" TEXT,
    "usabilityGoal" TEXT,
    "usabilityCharacteristic" TEXT,
    "gamificationElement" TEXT,
    "usabilityRecommendation" TEXT
);

-- CreateTable
CREATE TABLE "usability_characteristics" (
    "rule_idx" INTEGER,
    "usabilityGoal" TEXT,
    "ageGroup" TEXT,
    "disorder" TEXT,
    "applicationDomain" TEXT,
    "usabilityCharacteristic" TEXT
);

-- CreateTable
CREATE TABLE "usability_recommendations_for_gamification_elements_iso_" (
    "rule_idx" INTEGER,
    "gamificationElement" TEXT,
    "ISOrecommendation" TEXT,
    "elementUsabilityRecommendation" TEXT,
    "example" TEXT
);

-- CreateTable
CREATE TABLE "usability_recommendations_for_gamification_elements_wcag_2_2_" (
    "rule_idx" INTEGER,
    "gamificationElement" TEXT,
    "disorder" TEXT,
    "WCAGrecommendation" TEXT,
    "elementUsabilityRecommendation" TEXT,
    "example" TEXT
);
