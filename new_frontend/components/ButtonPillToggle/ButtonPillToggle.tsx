type ButtonPillToggleProps = {
  selected: boolean;
  label: string;
  onClick: () => void;
  notSuitable: boolean;
  updated?: boolean;
};

export default function ButtonPillToggle(props: ButtonPillToggleProps) {
  const { selected, notSuitable, updated } = props;

  const baseClasses =
    "transition duration-300 ease-in-out border-1 px-6 py-1 rounded-full";

  let styleClass = "";

  if (updated) {
    if (selected) {
      styleClass = notSuitable
        ? "bg-pink-200 text-pink-700 border-pink-700 hover:bg-pink-300"
        : "bg-yellow-200 text-yellow-700 border-yellow-700 hover:bg-yellow-300";
    } else {
      styleClass = notSuitable
        ? "bg-white-100 text-pink-700 border-pink-700 hover:bg-pink-300"
        : "bg-white-200 text-yellow-700 border-yellow-700 hover:bg-yellow-300";
    }
  } else if (selected) {
    styleClass = notSuitable
      ? "bg-red-200 text-red-700 border-red-700 hover:bg-red-300"
      : "bg-blue-200 text-blue-700 border-blue-700 hover:bg-blue-300";
  } else {
    styleClass = notSuitable
      ? "bg-white text-black border-gray-400 hover:text-red-700 hover:bg-red-200"
      : "bg-white text-black border-gray-400 hover:text-blue-700 hover:bg-blue-200";
  }

  return (
    <button
      title={notSuitable ? "Not suitable for your criteria" : undefined}
      className={`${styleClass} ${baseClasses}`}
      onClick={props.onClick}
    >
      {props.label}
    </button>
  );
}
