type ButtonOutlinedProps = {
  onClick: () => void;
  label: string;
};

export default function ButtonOutlined(props: ButtonOutlinedProps) {
  return (
    <button
      className="bg-white text-blue-500 hover:text-white hover:bg-blue-500 transition duration-300 ease-in-out border border-blue-500 hover:border-1 px-4 py-2 rounded-md"
      onClick={props.onClick}
    >
      {props.label}
    </button>
  );
}
