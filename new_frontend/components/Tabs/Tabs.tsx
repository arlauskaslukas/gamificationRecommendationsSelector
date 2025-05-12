"use client";

import { useState } from "react";

type Tab = {
  label: string;
  content: React.ReactNode;
};

type TabsProps = {
  tabs: Tab[];
};

export default function Tabs({ tabs }: TabsProps) {
  const [activeIndex, setActiveIndex] = useState(0);

  return (
    <div className="w-full">
      {/* Tab headers */}
      <div className="flex border-b border-gray-300">
        {tabs.map((tab, idx) => (
          <button
            key={tab.label}
            onClick={() => setActiveIndex(idx)}
            className={`px-4 py-2 text-sm font-medium border-b-2 -mb-px transition ${
              idx === activeIndex
                ? "border-blue-500 text-blue-600"
                : "border-transparent text-gray-500 hover:text-blue-500"
            }`}
          >
            {tab.label}
          </button>
        ))}
      </div>

      {/* Tab content */}
      <div className="mt-4 p-4 border border-gray-200 rounded-md bg-white shadow-sm">
        {tabs[activeIndex].content}
      </div>
    </div>
  );
}
