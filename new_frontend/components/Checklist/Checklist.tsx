"use client";

import { useState } from "react";

type ChecklistProps = {
  options: string[];
  selected: string[];
  onChange: (selected: string[]) => void;
  placeholder?: string;
};

export default function Checklist({
  options,
  selected,
  onChange,
  placeholder,
}: ChecklistProps) {
  const toggle = (value: string) => {
    if (selected.includes(value)) {
      onChange(selected.filter((v) => v !== value));
    } else {
      onChange([...selected, value]);
    }
  };

  return (
    <div className="bg-gray-50 p-4 border border-gray-300 rounded-md max-w-md">
      <h2 className="font-semibold mb-3 text-black">{placeholder}</h2>
      <ul className="space-y-2">
        {options.map((item) => (
          <li key={item} className="flex items-start gap-2">
            <input
              type="checkbox"
              id={item}
              checked={selected.includes(item)}
              onChange={() => toggle(item)}
              className="mt-1"
            />
            <label
              htmlFor={item}
              className="text-sm text-gray-800 cursor-pointer"
            >
              {item}
            </label>
          </li>
        ))}
      </ul>
    </div>
  );
}
