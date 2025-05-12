"use client";

import { useState, useRef, useEffect } from "react";

type Option = {
  label: string;
  value: string;
};

type MultiSelectDropdownProps = {
  options: Option[];
  selected: string[];
  onChange: (selected: string[]) => void;
  placeholder?: string;
};

export default function MultiSelectDropdown({
  options,
  selected,
  onChange,
  placeholder,
}: MultiSelectDropdownProps) {
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  // Close on outside click
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target as Node)
      ) {
        setIsOpen(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const toggleOption = (value: string) => {
    if (selected.includes(value)) {
      onChange(selected.filter((v) => v !== value));
    } else {
      onChange([...selected, value]);
    }
  };

  return (
    <div className="flex flex-col gap-2">
      <label className="text-black font-medium pl-2">{placeholder}</label>
      <div className="relative w-full max-w-sm" ref={dropdownRef}>
        <div
          className="flex flex-wrap gap-1 border border-gray-300 rounded-md p-2 cursor-pointer min-h-[44px]"
          onClick={() => setIsOpen(!isOpen)}
        >
          {selected.length === 0 && (
            <span className="text-gray-500">{placeholder}</span>
          )}
          {selected.map((value) => {
            const option = options.find((opt) => opt.value === value);
            return (
              <span
                key={value}
                className="bg-blue-100 text-blue-700 px-2 py-1 text-sm rounded flex items-center gap-1"
              >
                {option?.label}
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    toggleOption(value);
                  }}
                  className="hover:text-red-500"
                >
                  &times;
                </button>
              </span>
            );
          })}
        </div>

        {isOpen && (
          <div className="absolute z-10 mt-1 w-full bg-white border border-gray-300 rounded-md shadow-md max-h-60 overflow-auto">
            {options.map((option) => (
              <div
                key={option.value}
                onClick={() => toggleOption(option.value)}
                className={`p-2 cursor-pointer hover:bg-blue-400 text-black hover:text-white ${
                  selected.includes(option.value)
                    ? "bg-blue-300 font-medium"
                    : ""
                }`}
              >
                {option.label}
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
