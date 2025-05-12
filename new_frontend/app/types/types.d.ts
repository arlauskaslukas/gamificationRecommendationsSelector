export interface Criteria {
  usabilityGoal: string[];
  ageGroup: string[];
  disorder: string[];
  applicationDomain: string[];
  usabilityPrinciple: string[];
  gamificationGoal: string[];
}

export interface GamificationElementRow {
  id: number;
  ruleIdx: number;
  ageGroup: string;
  applicationDomain: string;
  disorder: string;
  gamificationGoal: string;
  usabilityGoal: string;
  usabilityCharacteristic: string;
  gamificationElement: string;
  usabilityRecommendation: string;
}

export interface ElementsType {
  suitable: {
    name: string;
    selected: boolean;
  }[]; // plain names
  notSuitable: {
    name: string;
    selected: boolean;
  }[]; // plain names
  other: {
    name: string;
    selected: boolean;
  }[]; // plain names
}

export interface ElementsResponse {
  suitable: string[];
  notSuitable: string[];
  other: string[];
}
/** One individual recommendation row (ISO or WCAG) */
export interface RecRow {
  disorder: string; // '-' for ISO rows
  recommendation: string; // renamed WCAG/ISO text
  elementUsabilityRecommendation: string | null;
  example: string | null;
}

/** Block returned per gamification element */
export interface ElementBlock {
  element: string; // the element’s name
  recommendations: RecRow[];
}

/** Entire API payload */
export type ElementsRecResponse = ElementBlock[];
