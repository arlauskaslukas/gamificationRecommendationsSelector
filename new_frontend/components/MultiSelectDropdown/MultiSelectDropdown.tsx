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

  const NOT_APPLICABLE = "Not applicable";
  const defaultOptions = [
    { label: NOT_APPLICABLE, value: NOT_APPLICABLE },
    ...options,
  ];
  const isNotApplicableSelected = selected.includes(NOT_APPLICABLE);

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

  // Handle selection logic for Not Applicable
  const toggleOption = (value: string) => {
    if (value === NOT_APPLICABLE) {
      if (isNotApplicableSelected) {
        onChange(selected.filter((v) => v !== NOT_APPLICABLE));
      } else {
        onChange([NOT_APPLICABLE]);
      }
    } else {
      if (isNotApplicableSelected) {
        // If Not Applicable is selected, remove it and add the new value
        onChange([value]);
      } else {
        // Toggle the selected value
        if (selected.includes(value)) {
          const newSelected = selected.filter((v) => v !== value);
          // If no other values are selected, add Not Applicable back
          if (newSelected.length === 0) {
            onChange([NOT_APPLICABLE]);
          } else {
            onChange(newSelected);
          }
        } else {
          onChange([...selected, value]);
        }
      }
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
            const option = defaultOptions.find((opt) => opt.value === value);
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
            <div
              onClick={() => toggleOption(NOT_APPLICABLE)}
              className={`p-2 cursor-pointer hover:bg-blue-400 text-black hover:text-white ${
                selected.includes(NOT_APPLICABLE)
                  ? "bg-blue-300 font-medium"
                  : ""
              }`}
            >
              {NOT_APPLICABLE}
            </div>
            {options.map((option) => {
              let isDisabled = isNotApplicableSelected;
              return (
                <div
                  key={option.value}
                  onClick={() => {
                    if (!isDisabled) toggleOption(option.value);
                  }}
                  className={`p-2 cursor-pointer hover:bg-blue-400 text-black hover:text-white ${
                    selected.includes(option.value)
                      ? "bg-blue-300 font-medium"
                      : ""
                  } ${isDisabled ? "opacity-50 cursor-not-allowed" : ""}`}
                >
                  {option.label}
                </div>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
}
