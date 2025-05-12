import { MouseEventHandler } from "react";

export type PaginationItemProps = {
  selected: boolean;
  pageNum: number;
  onClick: (num: number) => void;
};

export default function PaginationItem(props: PaginationItemProps) {
  return (
    <div
      onClick={() => props.onClick(props.pageNum)}
      className={`${
        props.selected
          ? "bg-blue-500 rounded-md text-white"
          : "bg-white border-1 border-blue-500 rounded-md text-blue-500 hover:bg-blue-500 hover:text-white transition duration-300 ease-in-out"
      } text-sm px-2 py-2 lg:px-4 lg:py-3 hover:cursor-pointer mx-2`}
    >
      {props.pageNum}
    </div>
  );
}
