import { RecommendationStatus } from "@prisma/client";

type SelectMarkToggleProps = {
  selected: boolean;
  value: RecommendationStatus;
  onClick: (status: RecommendationStatus | null) => void;
};

type StatusStyle = {
  selected: string;
  unselected: string;
};

const labelByStatus: Record<RecommendationStatus, string> = {
  [RecommendationStatus.FIT]: "Implemented",
  [RecommendationStatus.PARTIAL_FIT]: "Partially implemented",
  [RecommendationStatus.NON_FIT]: "Not implemented",
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

export default function RecStatusMark({
  selected,
  value,
  onClick,
}: SelectMarkToggleProps) {
  const classes = `${
    selected ? styleByStatus[value].selected : styleByStatus[value].unselected
  } transition duration-300 ease-in-out border px-6 py-1 rounded-full`;

  const handleClick = () => {
    onClick(selected ? null : value);
  };

  return (
    <button
      type="button"
      aria-pressed={selected}
      className={classes}
      onClick={handleClick}
    >
      {labelByStatus[value]}
    </button>
  );
}
