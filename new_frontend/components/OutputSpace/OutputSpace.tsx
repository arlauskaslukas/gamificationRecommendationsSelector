"use client";

import { Criteria } from "@/app/types/types";
import GeneralisedRecommendationsSection from "../GeneralisedRecommendationsSection/GeneralisedRecommendationsSection";
import RecommendationsForElementsSection from "../RecommendationsForElementsSection/RecommendationsForElementsSection";
import Tabs from "../Tabs/Tabs";

interface Props {
  criteria: Criteria;
}

export default function OutputSpace({ criteria }: Props) {
  const tabs = [
    {
      label: "Recommendations for gamified system",
      content: <GeneralisedRecommendationsSection criteria={criteria} />,
    },
    {
      label: "Recommendations for gamification elements",
      content: <RecommendationsForElementsSection criteria={criteria} />,
    },
  ];
  return (
    <div className="bg-white p-4 border border-gray-300 rounded-md w-full">
      <Tabs tabs={tabs} />
    </div>
  );
}
