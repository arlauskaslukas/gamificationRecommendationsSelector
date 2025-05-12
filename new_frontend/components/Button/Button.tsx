type ButtonProps = {
  onClick: () => void;
  label: string;
  disabled?: boolean;
};

export default function Button(props: ButtonProps) {
  return (
    <button
      onClick={props.onClick}
      className="bg-blue-500 text-white hover:text-blue-500 hover:bg-white transition duration-300 ease-in-out border-blue-500 hover:border-1 px-4 py-2 rounded-md"
      disabled={props.disabled ?? false}
    >
      {props.label}
    </button>
  );
}
