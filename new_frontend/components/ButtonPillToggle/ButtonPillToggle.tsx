type ButtonPillToggleProps = {
  selected: boolean;
  label: string;
  onClick: () => void;
  notSuitable: boolean;
};

export default function ButtonPillToggle(props: ButtonPillToggleProps) {
  return (
    <button
      title={props.notSuitable ? "Not suitable for your criteria" : undefined}
      className={`${
        props.selected
          ? props.notSuitable
            ? "bg-red-200 text-red-700 border-red-700 hover:bg-red-300"
            : "bg-blue-200 text-blue-700 border-blue-700 hover:bg-blue-300"
          : `bg-white text-black border-gray-400 ${
              props.notSuitable
                ? "hover:text-red-700 hover:bg-red-200"
                : "hover:text-blue-700 hover:bg-blue-200"
            }`
      } transition duration-300 ease-in-out border-1 px-6 py-1 rounded-full`}
      onClick={props.onClick}
    >
      {props.label}
    </button>
  );
}
