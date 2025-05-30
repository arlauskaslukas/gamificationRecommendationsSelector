import { RecommendationStatus } from "@prisma/client";
import { REACT_LOADABLE_MANIFEST } from "next/dist/shared/lib/constants";

type SelectMarkToggleProps = {
  selected: boolean;
  value: RecommendationStatus;
  onClick: (status: RecommendationStatus) => void;
};

type StatusStyle = {
  selected: string;
  unselected: string;
};

const labelByStatus: Record<RecommendationStatus, string> = {
  [RecommendationStatus.FIT]: "Fit",
  [RecommendationStatus.PARTIAL_FIT]: "Partial fit",
  [RecommendationStatus.NON_FIT]: "Non fit",
};

const styleByStatus: Record<RecommendationStatus, StatusStyle> = {
  [RecommendationStatus.FIT]: {
    selected: "bg-green-200 text-green-700 border-green-700 hover:bg-green-300",
    unselected:
      "bg-white text-black border-gray-400 hover:text-green-700 hover:bg-green-200",
  },
  [RecommendationStatus.PARTIAL_FIT]: {
    selected:
      "bg-yellow-200 text-yellow-700 border-yellow-700 hover:bg-yellow-300",
    unselected:
      "bg-white text-black border-gray-400 hover:text-yellow-700 hover:bg-yellow-200",
  },
  [RecommendationStatus.NON_FIT]: {
    selected: "bg-red-200 text-red-700 border-red-700 hover:bg-red-300",
    unselected:
      "bg-white text-black border-gray-400 hover:text-red-700 hover:bg-red-200",
  },
};

export default function RecStatusMark(props: SelectMarkToggleProps) {
  return (
    <button
      className={`${
        props.selected
          ? styleByStatus[props.value].selected
          : styleByStatus[props.value].unselected
      } transition duration-300 ease-in-out border-1 px-6 py-1 rounded-full`}
      onClick={() => props.onClick(props.value)}
    >
      {labelByStatus[props.value]}
    </button>
  );
}
