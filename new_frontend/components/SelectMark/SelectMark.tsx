type SelectMarkToggleProps = {
  selected: boolean;
  label: string;
  onClick: () => void;
};

export default function SelectMark(props: SelectMarkToggleProps) {
  return (
    <button
      className={`${
        props.selected
          ? "bg-blue-200 text-blue-700 border-blue-700 hover:bg-blue-300"
          : `bg-white text-black border-gray-400 hover:text-blue-700 hover:bg-blue-200`
      } transition duration-300 ease-in-out border-1 px-6 py-1 rounded-full`}
      onClick={props.onClick}
    >
      {props.label}
    </button>
  );
}
