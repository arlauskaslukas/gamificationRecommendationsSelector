"use client";

import { useState } from "react";

type AccordionItemProps = {
  title: string;
  children: React.ReactNode;
};

export default function AccordionItem({ title, children }: AccordionItemProps) {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div className="pb-2 border-b border-black">
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="w-full flex cursor-pointer justify-between items-center p-4 bg-transparent text-left text-md font-semibold text-blue-600"
      >
        {title}
        <span>{isOpen ? "−" : "+"}</span>
      </button>
      {isOpen && <div className="p-4 text-sm text-gray-700">{children}</div>}
    </div>
  );
}
