import { RecommendationStatus } from "@prisma/client";
import RecStatusMark from "../RecStatusMark/RecStatusMark";
import SelectMark from "../SelectMark/SelectMark";

type RecommendationItemCardProps = {
  onClick: (value: RecommendationStatus) => void;
  title: string;
  index: number;
  example: string;
  status: RecommendationStatus;
  recommendationName: string;
};

export default function RecommendationElementCard({
  title,
  index,
  example,
  recommendationName,
  status,
  onClick,
}: RecommendationItemCardProps) {
  return (
    <div
      key={index}
      className="w-full bg-white text-black py-2 pb-6 px-4 shadow-lg border-1"
    >
      <div className="font-bold text-xl">
        <h3>
          #{index + 1} {title}
        </h3>
      </div>
      <div className="flex flex-row text-[16px]">
        <p className="font-bold">Example:&nbsp;</p>
        <p>{example}</p>
      </div>
      <div className="flex flex-row text-[16px] font-bold">
        <p>{recommendationName}</p>
      </div>
      <div className="flex flex-row gap-4">
        <RecStatusMark
          selected={status == RecommendationStatus.NON_FIT}
          value={RecommendationStatus.NON_FIT}
          onClick={(value: RecommendationStatus) => {
            onClick(value);
          }}
        />
        <RecStatusMark
          selected={status == RecommendationStatus.PARTIAL_FIT}
          value={RecommendationStatus.PARTIAL_FIT}
          onClick={(value: RecommendationStatus) => {
            onClick(value);
          }}
        />
        <RecStatusMark
          selected={status == RecommendationStatus.FIT}
          value={RecommendationStatus.FIT}
          onClick={(value: RecommendationStatus) => {
            onClick(value);
          }}
        />
      </div>
    </div>
  );
}
