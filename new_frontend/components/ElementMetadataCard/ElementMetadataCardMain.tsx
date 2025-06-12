"use client";
import { RecommendationStatus } from "@prisma/client";
import RecStatusMark from "../RecStatusMark/RecStatusMark";
import {
  GamificationElementData,
  GamificationElementEntry,
  GroupedGamificationElement,
} from "@/app/types/types";

type RuleMetadataInteractiveCardMainProps = {
  props: GamificationElementData;
  selectionStatus: RecommendationStatus | null;

  onStatusChange: (id: number, newStatus: RecommendationStatus) => void;
};

export default function RuleMetadataInteractiveCardMain({
  props,
  onStatusChange,
  selectionStatus,
}: RuleMetadataInteractiveCardMainProps) {
  console.log(
    "Rendering RuleMetadataInteractiveCard for element:",
    props.gamificationElement
  );
  return (
    <div className="w-full bg-white text-black py-4 px-4 rounded-md shadow mb-6 h-full">
      <h2 className="text-xl font-bold mb-4">{props.gamificationElement}</h2>
      <div key={props.id} className="border-t border-gray-300 pt-4 mt-4">
        <div className="text-sm text-gray-600 mb-1 font-medium">
          Entry #{props.ruleIdx}
        </div>
        <div className="text-sm mb-2">
          <p>
            <strong>Recommendation:</strong> {props.usabilityRecommendation}
          </p>
        </div>
        <div className="grid grid-cols-2 gap-4 mb-4">
          <div>
            <p className="font-semibold">Age Group:</p>
            <p>{props.ageGroup ? props.ageGroup : "Not applicable"}</p>
          </div>
          <div>
            <p className="font-semibold">Application Domain:</p>
            <p>
              {props.applicationDomain
                ? props.applicationDomain
                : "Not applicable"}
            </p>
          </div>
          <div>
            <p className="font-semibold">Disorder:</p>
            <p>{props.disorder ? props.disorder : "Not applicable"}</p>
          </div>
          <div>
            <p className="font-semibold">Usability Goal:</p>
            <p>
              {props.usabilityGoal ? props.usabilityGoal : "Not applicable"}
            </p>
          </div>

          <div>
            <p className="font-semibold">Gamification Goal:</p>
            <p>{props.gamificationGoal ? props.ageGroup : "Not applicable"}</p>
          </div>
        </div>
        <div className="flex flex-row gap-4 mt-2">
          {Object.values(RecommendationStatus).map((status) => (
            <RecStatusMark
              key={status}
              selected={selectionStatus === status}
              value={status}
              onClick={() => onStatusChange(props.id, status)}
            />
          ))}
        </div>
      </div>
    </div>
  );
}
