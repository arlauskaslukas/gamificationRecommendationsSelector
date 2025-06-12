"use client";
import { RecommendationStatus } from "@prisma/client";
import RecStatusMark from "../RecStatusMark/RecStatusMark";

type RuleMetadataInteractiveCardProps = {
  element: string;
  data: {
    id: number;
    selectionStatus: RecommendationStatus | null;
    suitableGamificationElements: {
      ageGroup: string;
      applicationDomain: string;
      disorder: string;
      gamificationGoal: string;
      usabilityGoal: string;
      usabilityRecommendation: string;
    };
  };
  onStatusChange: (id: number, newStatus: RecommendationStatus) => void;
};

export default function RuleMetadataInteractiveCard({
  element,
  data,
  onStatusChange,
}: RuleMetadataInteractiveCardProps) {
  console.log("Rendering RuleMetadataInteractiveCard for element:", element);
  return (
    <div className="w-full bg-white text-black py-4 px-4 rounded-md shadow mb-6 h-full">
      <h2 className="text-xl font-bold mb-4">{element}</h2>
      <div key={data.id} className="border-t border-gray-300 pt-4 mt-4">
        <div className="text-sm text-gray-600 mb-1 font-medium">
          Entry #{data.id}
        </div>
        <div className="text-sm mb-2">
          <p>
            <strong>Recommendation:</strong>{" "}
            {data.suitableGamificationElements.usabilityRecommendation}
          </p>
        </div>
        <div className="grid grid-cols-2 gap-4 mb-4">
          <div>
            <p className="font-semibold">Age Group:</p>
            <p>
              {data.suitableGamificationElements.ageGroup
                ? data.suitableGamificationElements.ageGroup
                : "Not applicable"}
            </p>
          </div>
          <div>
            <p className="font-semibold">Application Domain:</p>
            <p>
              {data.suitableGamificationElements.applicationDomain
                ? data.suitableGamificationElements.applicationDomain
                : "Not applicable"}
            </p>
          </div>
          <div>
            <p className="font-semibold">Disorder:</p>
            <p>
              {data.suitableGamificationElements.disorder
                ? data.suitableGamificationElements.disorder
                : "Not applicable"}
            </p>
          </div>
          <div>
            <p className="font-semibold">Usability Goal:</p>
            <p>
              {data.suitableGamificationElements.usabilityGoal
                ? data.suitableGamificationElements.usabilityGoal
                : "Not applicable"}
            </p>
          </div>

          <div>
            <p className="font-semibold">Gamification Goal:</p>
            <p>
              {data.suitableGamificationElements.gamificationGoal
                ? data.suitableGamificationElements.ageGroup
                : "Not applicable"}
            </p>
          </div>
        </div>
        <div className="flex flex-row gap-4 mt-2">
          {Object.values(RecommendationStatus).map((status) => (
            <RecStatusMark
              key={status}
              selected={data.selectionStatus === status}
              value={status}
              onClick={() => onStatusChange(data.id, status)}
            />
          ))}
        </div>
      </div>
    </div>
  );
}
